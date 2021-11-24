using AutoMapper;
using JeuxVideo.Data.Dtos;
using JeuxVideo.Data.Models;

namespace JeuxVideo.Data.Profiles
{
    public class JeuxProfile : Profile
    {
        /* Constructeur */
        public JeuxProfile()
        {
            CreateMap<Jeu, JeuxDTO>();
            CreateMap<JeuxDTO, Jeu>();
        }

       
    }
}
