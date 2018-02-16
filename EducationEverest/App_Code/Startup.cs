using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EducationEverest.Startup))]
namespace EducationEverest
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }

    }
}
