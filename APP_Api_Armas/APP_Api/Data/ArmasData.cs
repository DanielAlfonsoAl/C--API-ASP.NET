
using APP_Api.Models;

using APP_Api_Armas.Data;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace APP_Api
{
    public class ArmasData
    {
        public static bool RegistrarUsuario(Armas ObjUsuario)
        {
            ConexionBD objEst = new ConexionBD();
            string sentencia;
            sentencia = "EXECUTE USP_Registrar '" + ObjUsuario.Id_Arma + "','" + ObjUsuario.Nombre_Arma + "','" + ObjUsuario.Cantidad_Arma + "','" + ObjUsuario.Costo_Arma + "','" + ObjUsuario.Tipo_Arma + "','" + ObjUsuario.Fecha_Arma + "','" + ObjUsuario.Balas_Ama + "','" + ObjUsuario.Permiso_Arma + "','" + ObjUsuario.Accesorios_Arma + "','" + ObjUsuario.Descripcion_Arma + "'";
            if (!objEst.EjecutarSentencia(sentencia, false))
            {
                objEst = null;
                return false;
            }
            else
            {
                objEst = null;
                return true;
            }
        }
        public static bool ActualizarUsuario(Armas ObjUsuario)
        {
            ConexionBD objEst = new ConexionBD();
            string sentencia;
            sentencia = "EXECUTE USP_Actualizar '" + ObjUsuario.Id_Arma + "','" + ObjUsuario.Nombre_Arma + "','" + ObjUsuario.Cantidad_Arma + "','" + ObjUsuario.Costo_Arma + "','" + ObjUsuario.Tipo_Arma + "','" + ObjUsuario.Fecha_Arma + "','" + ObjUsuario.Balas_Ama + "','" + ObjUsuario.Permiso_Arma + "','" + ObjUsuario.Accesorios_Arma + "','" + ObjUsuario.Descripcion_Arma + "'";
            if (!objEst.EjecutarSentencia(sentencia, false))
            {
                objEst = null;
                return false;
            }
            else
            {
                objEst = null;
                return true;
            }
        }
        public static bool EliminarUsuario(string id)
        {
            ConexionBD objEst = new ConexionBD();
            string sentencia;
            sentencia = "EXECUTE USP_Eliminar '" + id + "'";
            if (!objEst.EjecutarSentencia(sentencia, false))
            {
                objEst = null;
                return false;
            }
            else
            {
                objEst = null;
                return true;
            }
        }
        public static List<Armas> Obtener(string id)
        {
            List<Armas> oListaUsuario = new List<Armas>();
            ConexionBD objEst = new ConexionBD();
            string sentencia;
            sentencia = "EXECUTE USP_Obtener '" + id + "'";
            if (objEst.Consultar(sentencia, false))
            {
                SqlDataReader dr = objEst.Reader;
                while (dr.Read())
                {
                    oListaUsuario.Add(new Armas()
                    {
                        Id_Arma = dr["id_Arma"].ToString(),
                        Nombre_Arma = dr["nombre_Arma"].ToString(),
                        Cantidad_Arma = Convert.ToInt32(dr["cantidad_Arma"]),
                        Costo_Arma = float.Parse(dr["costo_Arma"].ToString()),
                        Tipo_Arma = dr["tipo_Arma"].ToString(),
                        Fecha_Arma = Convert.ToDateTime(dr["fecha_Arma"]),
                        Balas_Ama = dr["balas_Arma"].ToString(),
                        Permiso_Arma = Convert.ToByte(dr["permiso_Arma"]),
                        Accesorios_Arma = dr["accesorios"].ToString(),
                        Descripcion_Arma = dr["descrippcion"].ToString()
                    });
                }
                return oListaUsuario;
            }
            else
            {
                return oListaUsuario;
            }
        }
        public static List<Armas> Listar()
        {
            List<Armas> oListaUsuario = new List<Armas>();
            ConexionBD objEst = new ConexionBD();
            string sentencia;
            sentencia = "EXECUTE USP_Listar";
            if (objEst.Consultar(sentencia, false))
            {
                SqlDataReader dr = objEst.Reader;
                while (dr.Read())
                {
                    oListaUsuario.Add(new Armas()
                    {
                        Id_Arma = dr["id_Arma"].ToString(),
                        Nombre_Arma = dr["nombre_Arma"].ToString(),
                        Cantidad_Arma = Convert.ToInt32(dr["cantidad_Arma"]),
                        Costo_Arma = float.Parse(dr["costo_Arma"].ToString()),
                        Tipo_Arma = dr["tipo_Arma"].ToString(),
                        Fecha_Arma = Convert.ToDateTime(dr["fecha_Arma"].ToString()),
                        Balas_Ama = dr["balas_Arma"].ToString(),
                        Permiso_Arma = Convert.ToByte(dr["permiso_Arma"]),
                        Accesorios_Arma = dr["accesorios"].ToString(),
                        Descripcion_Arma = dr["descrippcion"].ToString()
                    });
                }
                return oListaUsuario;
            }
            else
            {
                return oListaUsuario;
            }
        }
    }
}