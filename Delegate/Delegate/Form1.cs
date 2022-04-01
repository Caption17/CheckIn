using System;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;

namespace Delegate
{
    public partial class Form1 : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private bool CheckFormExist(string frmName)
        {
            foreach (Form f in this.MdiChildren)
            {
                if (f.Name.Equals(frmName))
                    return true;
            }
            return false;
        }

        private void BarButtonItem2_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            FrameWelcome frm = new FrameWelcome();
            if (!IsFormOpen(typeof(FrameWelcome)))
            {
                Screen[] screen = Screen.AllScreens;
                if (screen.Length > 1)
                {
                    frm.Left = screen[1].Bounds.Width;
                    frm.Top = screen[1].Bounds.Height;
                    frm.StartPosition = FormStartPosition.Manual;
                    frm.Location = screen[1].WorkingArea.Location;
                    frm.Show();
                }
                else
                {
                    frm.Show();
                }
            }
            else
            {
                frm.Activate();
            }
        }

        private bool IsFormOpen(Type formType)
        {
            foreach (Form form in Application.OpenForms)
                if (formType.Name == form.Name)
                    return true;
            return false;
        }

        private void barButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            QLDB frm = new  QLDB();
            if (CheckFormExist(frm.Name))
            {
                foreach (Form f in this.MdiChildren)
                {
                    if (f.Name.Equals(frm.Name))
                        f.Activate();
                }
            }
            else
            {
                frm.MdiParent = this;
                frm.Show();
            }
        }

        private void barButtonItem2_ItemClick_1(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            using (var f = new CheckinOut())
            {
                f.ShowDialog();
            }    
            //CheckInOut frm = new CheckInOut();
            //if (CheckFormExist(frm.Name))
            //{
            //    foreach (Form f in this.MdiChildren)
            //    {
            //        if (f.Name.Equals(frm.Name))
            //            f.Activate();
            //    }
            //}
            //else
            //{
            //    frm.MdiParent = this;
            //    frm.Show();
            //}
        }
    }
}
