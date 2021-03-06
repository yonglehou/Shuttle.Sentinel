using System.Web.Http;

namespace Shuttle.Sentinel.WebApi
{
    public static class WebApiConfiguration
    {
        public static void Register(HttpConfiguration configuration)
        {
            configuration.Routes.MapHttpRoute("DefaultApi", "api/{controller}/{id}", new {id = RouteParameter.Optional}
                );
        }
    }
}