using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SarasaviLibrary.Startup))]
namespace SarasaviLibrary
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
