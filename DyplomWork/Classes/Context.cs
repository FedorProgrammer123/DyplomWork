using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using DyplomWork.Datas;

namespace DyplomWork.Classes
{
    public class Context:DbContext
    {
        public static Context context;
        public DbSet<Users> Users { get; set; }
        public static Roles usersrole { get; set; }
        public DbSet<Roles> roles { get; set; }
        public DbSet<Test> test { get; set; }
        public static Context GetContext()
        {
            if(context == null)
            {
                context = new Context();
            }
            return context;
        }
        public Context() : base("name=DyplomWorkEntities")
        {

        }
    }
}
