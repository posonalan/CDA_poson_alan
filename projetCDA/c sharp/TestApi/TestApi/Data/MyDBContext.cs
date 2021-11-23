using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TestApi.Data
{ /* La classe contexte permet de cr�er la relation (session) avec la base de donn�es. */ 
    public class MyDbContext : DbContext
    {
        public MyDbContext(DbContextOptions<MyDbContext> options) : base(options)

        {

        }
    }
}
