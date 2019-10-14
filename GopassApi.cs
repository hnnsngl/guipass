using System.Diagnostics;
using System.IO;

namespace guipass
{
    public class GopassApi
    {
        private Process LaunchGopassListener()
        {
            var startInfo = new ProcessStartInfo
            {
                UseShellExecute = false,
                RedirectStandardInput = true,
                RedirectStandardOutput = true,
                RedirectStandardError = true,
                FileName = "/home/hannes/.config/gopass/gopass_wrapper.sh",
            };


            var process = new Process {StartInfo = startInfo};
            process.Start();


            return process;
        }

        public string SendMessage(string message)
        {
            using (var process = LaunchGopassListener())
            {
                
                var binaryToStdIn = new BinaryWriter(process.StandardInput.BaseStream);
                binaryToStdIn.Write(message.Length);
                process.StandardInput.WriteLine(message);
                process.StandardInput.Close();
                return process.StandardOutput.ReadToEnd();
            }
        }
    }
}