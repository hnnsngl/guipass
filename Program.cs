using Qml.Net;
using Qml.Net.Runtimes;


namespace guipass
{
    class Program
    {
        private static int Main(string[] args)
        {
            GetResponse();

            RuntimeManager.DiscoverOrDownloadSuitableQtRuntime();
            QQuickStyle.SetStyle("Material");

            using (var application = new QGuiApplication())
            {
                using (var qmlEngine = new QQmlApplicationEngine())
                {
                    qmlEngine.Load("Main.qml");
                    return application.Exec();
                }
            }
        }

        static void GetResponse()
        {
            var api = new guipass.GopassApi();
            const string message = "{\"type\":\"query\",\"query\":\"\"}";
            System.Console.WriteLine(message);
            var response = api.SendMessage(message);
            System.Console.WriteLine(response);
        }
    }
}