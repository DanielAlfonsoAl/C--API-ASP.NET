using APP_Api.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace APP_Api.Controllers
{
    public class ArmasController : ApiController
    {
        // GET api/<controller>
        public List<Armas> Get()
        {
            return ArmasData.Listar();
        }
        // GET api/<controller>/5
        public List<Armas> Get(string id)
        {
            return ArmasData.Obtener(id);
        }
        // POST api/<controller>
        public bool Post([FromBody] Armas oUsuario)
        {
            return ArmasData.RegistrarUsuario(oUsuario);
        }
        // PUT api/<controller>/5
        public bool Put([FromBody] Armas oUsuario)
        {
            return ArmasData.ActualizarUsuario(oUsuario);
        }
        // DELETE api/<controller>/5
        public bool Delete(string id)
        {
            return ArmasData.EliminarUsuario(id);
        }
    }
}