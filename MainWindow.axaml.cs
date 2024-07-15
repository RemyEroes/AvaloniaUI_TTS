using Avalonia.Controls;
using System.Diagnostics;
using System.IO;
using System;

namespace PiperTTSApp
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private async void OnPlayButtonClick(object sender, Avalonia.Interactivity.RoutedEventArgs e)
        {
            
                // script path
                string scriptPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.UserProfile), "demo-avalonia-TTS.sh");

                // run the demo script
                var processStartInfo = new ProcessStartInfo
                {
                    FileName = "/bin/bash",
                    Arguments = $"-c \"'{scriptPath}'\"",
                    RedirectStandardOutput = true,
                    RedirectStandardError = true,
                    UseShellExecute = false,
                    CreateNoWindow = true,
                };

                var process = new Process { StartInfo = processStartInfo };
                process.Start();

                string output = await process.StandardOutput.ReadToEndAsync();
                string error = await process.StandardError.ReadToEndAsync();

                process.WaitForExit();
        }
    }
}