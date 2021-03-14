using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text.RegularExpressions;

namespace Assembler
{
    class Program
    {
        private static readonly Dictionary<string, byte> OpCodes = new Dictionary<string, byte>()
        {
            {"LDA", 0b00010000},
            {"ADD", 0b00100000},
            {"SUB", 0b00110000},
            {"STA", 0b01000000},
            {"LDI", 0b01010000},
            {"LDS", 0b01100000},
            {"JMP", 0b01110000},
            {"JC",  0b10000000},
            {"JZ",  0b10010000},
            {"ADS", 0b10100000},
            {"SUS", 0b10110000},
            {"OTH", 0b11100000},
            {"OUT", 0b11110000},
        };
        private static readonly List<int> ScanCodes = new List<int>();

        static void Main(string[] args)
        {
            Console.WriteLine($"Reading File {args[0]}...");

            using var input = File.OpenRead(args[0]);
            using var reader = new StreamReader(input);
            if (File.Exists(args[1]))
            {
                File.Delete(args[1]);
            }
            using var output = File.OpenWrite(args[1]);
            using var writer = new BinaryWriter(output);

            string code;
            var codePattern = new Regex(@"^\s*((?<opcode>(\w+))(\s*(?=\$|\#))*)*((?<operandtype>(\$|\#))(?<operand>(-?\d+)\s*)(\,\s*(?=\$|\#))*)*(\s+\;[\s\w]*)*$");
            var address = 0;
            bool isSuccessful = true;

            while ((code = reader.ReadLine()) != null)
            {
                if (code.StartsWith(";"))
                    continue;

                var tokens = codePattern.Match(code);
                if (!tokens.Success)
                    //catch the error in next loop ¯\_(ツ)_/¯
                    break;
                int offset = 0;
                if (tokens.Groups["opcode"].Success)
                    offset = 1;

                if (tokens.Groups["operand"].Success && tokens.Groups["operand"].Captures.Count > 1)
                    offset += 2;
                else
                    offset += 1;

                ScanCodes.Add(offset);
            }

            input.Position = 0;
            reader.DiscardBufferedData();

            while ((code = reader.ReadLine()) != null)
            {
                if (code.StartsWith(";"))
                    continue;

                var tokens = codePattern.Match(code);

                if (address > 255)
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine("This program requires more than 256 bytes and cannot be run on MSAP-1!");
                    Console.ForegroundColor = ConsoleColor.White;
                    isSuccessful = false;
                    break;
                }

                if (!tokens.Success)
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine($"Invalid code at address {address}");
                    Console.ForegroundColor = ConsoleColor.White;
                    isSuccessful = false;
                    break;
                }

                if (tokens.Groups["opcode"].Success)
                {
                    Console.WriteLine($"Writing OpCode at address {address}");
                    writer.Write((byte)address++);
                    writer.Write(OpCodes[tokens.Groups["opcode"].Value]);
                }

                Console.WriteLine($"Writing operand at address {address}");
                writer.Write((byte)address++);
                if (tokens.Groups["operand"].Success)
                {
                    var offset = 0;
                    if (tokens.Groups["operand"].Captures.Count > 1)
                    {
                        var operand = int.Parse(tokens.Groups["operand"].Captures[0].Value);
                        if (tokens.Groups["operandtype"].Captures[0].Value == "$")
                        {
                            offset = ScanCodes.Take(operand).Sum();
                            writer.Write((sbyte)offset);
                        }
                        else
                            writer.Write((sbyte)operand);
                        Console.WriteLine($"Writing 2nd operand at address {address}");
                        writer.Write((byte)address++);
                        operand = int.Parse(tokens.Groups["operand"].Captures[1].Value);
                        if (tokens.Groups["operandtype"].Captures[1].Value == "$")
                        {
                            offset = ScanCodes.Take(operand).Sum();
                            writer.Write((sbyte)offset);
                        }
                        else
                            writer.Write((sbyte)operand);
                    }
                    else
                    {
                        var operand = int.Parse(tokens.Groups["operand"].Value);
                        if (tokens.Groups["operandtype"].Value == "$")
                        {
                            offset = ScanCodes.Take(operand).Sum();
                            writer.Write((sbyte)offset);
                        }
                        else
                            writer.Write((sbyte)operand);
                    }
                }
                else
                {
                    writer.Write((sbyte)0);
                }
            }

            writer.Close();
            reader.Close();

            if (isSuccessful)
            {
                Console.ForegroundColor = ConsoleColor.Green;
                Console.WriteLine("HEX file generated successfully.");
                Console.ForegroundColor = ConsoleColor.White;
            }
        }
    }
}
