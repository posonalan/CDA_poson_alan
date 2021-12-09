using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Primeur.Data
{
    public class MyDbContext : DbContext
    {
        public DbSet<Fruits> Fruits { get; set; }
        public DbSet<Legumes> Legumes { get; set; }
        public MyDbContext(DbContextOptions<MyDbContext> options) : base(options) { }








    }

    }
