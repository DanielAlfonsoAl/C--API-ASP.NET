using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace APP_Api.Models
{
    public class Armas
    {
        #region Propiedades
        public string Id_Arma { get; set; }
        public string Nombre_Arma { get; set; }
        public int Cantidad_Arma { get; set; }
        public float Costo_Arma { get; set; }
        public string Tipo_Arma { get; set; }
        public DateTime Fecha_Arma { get; set; }
        public string Balas_Ama { get; set; }
        public Byte Permiso_Arma { get; set; }
        public string Accesorios_Arma { get; set; }
        public string Descripcion_Arma  { get; set; }   

        #endregion
    }
}