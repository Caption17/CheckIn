using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;

using System.Collections;
using System.Configuration;
using System.IO;
using System.Diagnostics;

namespace Delegate
{
    public partial class DSCanbo : DevExpress.XtraEditors.XtraForm
    {
        DelegateFastdbDataContext db = new DelegateFastdbDataContext();
        //FrameWelcome frm = new FrameWelcome();
        
        
        
        public DSCanbo()
        {
            InitializeComponent();
        }

        private void CheckInOut_Load(object sender, EventArgs e)
        {
            
            RefreshDataGridview();
            gridView1.RefreshData();
        }


        public List <Nha_GetDaiBieuAllDonviResult> getAllDaiBieu()
        {
            List<Nha_GetDaiBieuAllDonviResult> rs = db.Nha_GetDaiBieuAllDonvi().ToList();
            return rs;
        }

        public bool IsFormOpen(Type formType)
        {
            foreach (Form form in Application.OpenForms)
                if (formType.Name == form.Name)
                    return true;
            return false;
        }

       
        public void RefreshDataGridview()
        {
            List<Nha_GetDaiBieuAllDonviResult> lst = getAllDaiBieu();
            if (getAllDaiBieu() != null)
            {
                bindingSource1.DataSource = lst;
                gridControl1.RefreshDataSource();
                gridView1.RefreshData();

            }
            else
            {
                bindingSource1.Clear();
                gridView1.RefreshData();
               
            }
        }

       
        
       
    }
}
