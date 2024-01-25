using System;
using BCrypt.Net;


string senha = Environment.GetEnvironmentVariable("SENHA");
string hashDaSenha = BCrypt.Net.BCrypt.HashPassword(senha);

Console.WriteLine(hashDaSenha);
