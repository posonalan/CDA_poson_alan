using JeuxVideo.Data.Models;
using Microsoft.EntityFrameworkCore;

namespace JeuxVideo.Data
{
    public class MyDbContext : DbContext
    {
        public DbSet<Jeu> Jeux { get; set; }
        /* Ce constructeur fait appel au constructeur hérité et lui passera les options de connexion à la base de données */
        public MyDbContext(DbContextOptions<MyDbContext> options) : base(options)
        {
        }
    }
}
