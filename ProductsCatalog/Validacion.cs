using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace ProductsCatalog
{
    public static class Validaciones
    {
        public static bool CamposVacios(params string[] campos)
        {
            foreach (var campo in campos)
            {
                if (string.IsNullOrWhiteSpace(campo))
                    return true;
            }
            return false;
        }
    }
}