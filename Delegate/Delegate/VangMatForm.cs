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
    public partial class VangMatForm : DevExpress.XtraEditors.XtraForm
    {
        DelegateFastdbDataContext db = new DelegateFastdbDataContext();
        //FrameWelcome frm = new FrameWelcome();
        
        
        
        public VangMatForm()
        {
            InitializeComponent();
        }

        private void CheckInOut_Load(object sender, EventArgs e)
        {
            
            RefreshDataGridview();
            gridView1.RefreshData();
        }


        public List <Canbo> getAllDaiBieu()
        {
            //List<DLCanbo> lst = (from dbi in db.DLCanbos orderby dbi.Donvi select dbi).ToList();
            var itemID = db.THAMGIAs.Select(x => x.IDDAIBIEU).ToArray();
            List<Canbo> VangMat = (from o in db.Canbos.Where(x => !itemID.Contains(x.IDCanbo)) select o).ToList();

            if (VangMat.Count > 0)
            {
                return VangMat;
            }
            else
                return null;
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
            List<Canbo> lst = getAllDaiBieu();
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
