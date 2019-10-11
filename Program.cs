using System;
using Qml.Net;
using Qml.Net.Runtimes;


namespace guipass
{
    class Program
    {
        static int Main(string[] args)
        {
            RuntimeManager.DiscoverOrDownloadSuitableQtRuntime();
            QQuickStyle.SetStyle("Material");
            
            using (var application = new QGuiApplication())
            {
                using (var  qmlEngine = new QQmlApplicationEngine())
                {
                    qmlEngine.Load("Main.qml");
                    return application.Exec();
                }
            }
        }
    }
}
