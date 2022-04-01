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
using System.Globalization;
using DevExpress.XtraGrid.Views.Base;

namespace Delegate
{
    public partial class CheckinOut : DevExpress.XtraEditors.XtraForm
    {
        DelegateFastdbDataContext db = new DelegateFastdbDataContext();
        FrameWelcome frm = new FrameWelcome();
        public static Nha_ShowScreenResult delegateCheckInOut;
        public CheckinOut()
        {
            InitializeComponent();
        }

        private void CheckInOut_Load(object sender, EventArgs e)
        {
            txtCode.Focus();
            RefreshDataGridview();
            KhachItems = (from Khach in db.Canbos where (Khach.MaCanbo.Substring(0, 1) == "G" || Khach.MaCanbo == null || Khach.MaCanbo == "NULL" || Khach.MaCanbo == "") select Khach).OrderByDescending(x => x.IDCanbo).ToList();

            if (KhachItems.Count > 0)
                if (KhachItems.Count > 0)
            {
                canboBindingSource.DataSource = KhachItems;
                gridControl2.RefreshDataSource();

            }
        }

        public Nha_GetDaiBieuThamDuOfMaCanBoResult getDataByCode(string code)
        {
            //List<DAIBIEU> lst = (from dbi in db.DAIBIEUs where dbi.DBCODE == code select dbi).ToList();
            Nha_GetDaiBieuThamDuOfMaCanBoResult dbie = db.Nha_GetDaiBieuThamDuOfMaCanBo(code).FirstOrDefault();

            return dbie;
        }

        public THAMGIA getDataByCodeTG(int MaThamgia)
        {
            
                THAMGIA tg = (from tgs in db.THAMGIAs where tgs.IDTHAMGIA == MaThamgia select tgs).FirstOrDefault();
                return tg;
           
        }

        public THAMGIA checkExist(string code)
        {
            Canbo dbi = (from dbieu in db.Canbos where dbieu.MaCanbo == code select dbieu).SingleOrDefault();
            THAMGIA tg = null;
            if (dbi != null)
            {
                tg = (from tgi in db.THAMGIAs where tgi.IDDAIBIEU == dbi.IDCanbo select tgi).SingleOrDefault();
            }
            if (tg == null)
            {
                return null;
            }
            else
            {
                return tg;
            }
        }

        //public List <DAIBIEUDAI> getAllDaiBieu()
        //{
        //    List<THAMGIA> lst = (from dbi in db.DAIBIEUs join tg in db.THAMGIAs on dbi.IDDAIBIEU equals tg.IDDAIBIEU
        //                         select new
        //                         {
        //                             dbi.DBCODE,
        //                             dbi.DBNAME,
        //                             tg.DAI

        //                         }).ToList();
        //    if (lst.Count > 0)
        //    {
        //        return lst;
        //    }
        //    else
        //        return null;
        //}

        public bool IsFormOpen(Type formType)
        {
            foreach (Form form in Application.OpenForms)
                if (formType.Name == form.Name)
                    return true;
            return false;
        }

        private void simpleButton4_Click(object sender, EventArgs e)
        {
            SaveFileDialog savefileDiag = new SaveFileDialog();
            if (savefileDiag.ShowDialog() == DialogResult.OK)
            {
                gridControl1.ExportToXlsx(savefileDiag.FileName);
            }
        }

        public void RefreshDataGridview()
        {
            //List<DAIBIEU> lst = getAllDaiBieu();

            var lst = db.Nha_GetDaiBieuThamDu().ToList();
            var kkk = db.Nha_GetDaiBieuByGuest();
           
            double slDaiBieu = db.Nha_GetDaiBieu().ToList().Count * 1.0;
            if (lst.Count > 0)
            {
                bindingSource1.DataSource = lst;


                lbSL.Text = lst.Count().ToString() + "/" + slDaiBieu.ToString();
                double tyle = lst.Count() / slDaiBieu;
                // lblTyLe.Text = tyle.ToString("P", CultureInfo.InvariantCulture);
                // lblthoidiem.Text = DateTime.Now.ToString("dd-MM-yyyy - hh:mm:ss");
                txtCode.Text = "";
                txtCode.Focus();
                gridControl1.RefreshDataSource();
            }
            else
            {
                bindingSource1.Clear();
                gridView1.RefreshData();
                lbSL.Text = "0".ToString();
            }
        }

        private void simpleButton2_Click(object sender, EventArgs e)
        {
            using (var f = new DSCanbo())
            {
                f.ShowDialog();
            }
        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {
            DialogResult dlr = MessageBox.Show("Bạn có chắc chắn xóa không?",
     "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dlr == DialogResult.No) return;

            List<THAMGIA> lst = null;
            if (gridView1.GetFocusedRow() != null && gridView1.DataRowCount > 0)
            {
                //@Nha: Delete
                int DBCODE = (bindingSource1.Current as Nha_GetDaiBieuThamDuResult).IDTHAMGIA;
                //string DBCODE = gridView1.GetRowCellValue(gridView1.FocusedRowHandle, gridView1.Columns[0]).ToString();

                THAMGIA tg = getDataByCodeTG(DBCODE);

                db.THAMGIAs.DeleteOnSubmit(tg);
                db.SubmitChanges();
                RefreshDataGridview();
                this.BringToFront();
                this.Focus();

            }
            else
            {
                MessageBox.Show("Không có dữ liệu để xóa", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);

            }

            if (lst != null)
            {
                db.THAMGIAs.DeleteOnSubmit(lst[0]);
                db.SubmitChanges();
                RefreshDataGridview();
            }
        }
        string MSSCB;
        int IDCanbo;
        private void txtCode_KeyDown(object sender, KeyEventArgs e)
        {

            if (e.KeyData == Keys.F6)
            {
                txtCode.Focus();
                //txtCode.Text = "";
                //txtName.Text = "";
                // txtDepartment.Text = "";
            }
            if (e.KeyData == Keys.Enter)
            {
                MSSCB = txtCode.Text;
                //tim xem MCB nay ton tai khong
                Canbo CanboCur = (from cb in db.Canbos where cb.MaCanbo == txtCode.Text select cb).FirstOrDefault();
                
                if (CanboCur == null)
                {
                    // MessageBox.Show("Không tìm thấy thông tin viên chức!!!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
                    txtCode.Focus();
                    // txtCode.Text = "";
                    lblinfo.Text = "Không tìm thấy";
                    RefreshDataGridview();
                    return;
                }


                if (CanboCur != null)// neu ton tai trong Canbo
                {
                    IDCanbo = CanboCur.IDCanbo;
                    // Lay du lieu kiem tra xem co checkin chua.
                    // Nha_GetDaiBieuThamDuOfMaCanBoResult Thamgia = getDataByCode(txtCode.Text);
                    Nha_GetMaxNgayCheckinOFDaiBieuResult Thamdu = db.Nha_GetMaxNgayCheckinOFDaiBieu(txtCode.Text).FirstOrDefault();
                    if (Thamdu == null)//thêm mới
                    {
                        THAMGIA add = new THAMGIA();
                        Canbo dbiinsert = (from ab in db.Canbos where ab.MaCanbo == txtCode.Text select ab).FirstOrDefault();
                        add.IDDAIBIEU = dbiinsert.IDCanbo;
                        add.MaCanbo = dbiinsert.MaCanbo;
                        add.Checkin = DateTime.Now;
                        // add.Checkout = "-";
                        db.THAMGIAs.InsertOnSubmit(add);
                        db.SubmitChanges();
                        RefreshDataGridview();
                        txtCode.Focus();
                        // txtCode.Text = "";
                        //txtName.Text = "";
                        // txtDepartment.Text = "";
                    }
                    else if (Thamdu.Checkin != null && Thamdu.Checkout != null)//thêm mới
                    {
                        THAMGIA add = new THAMGIA();
                        Canbo dbiinsert = (from ab in db.Canbos where ab.MaCanbo == txtCode.Text select ab).FirstOrDefault();
                        add.IDDAIBIEU = dbiinsert.IDCanbo;
                        
                        add.MaCanbo = dbiinsert.MaCanbo;
                        add.Checkin = DateTime.Now;
                        //add.Checkout = "-";
                        db.THAMGIAs.InsertOnSubmit(add);
                        db.SubmitChanges();
                        RefreshDataGridview();
                        txtCode.Focus();
                          
                        // txtCode.Text = "";
                        // txtName.Text = "";
                        //txtDepartment.Text = "";
                    }

                    else if (Thamdu.Checkout == null || Thamdu.Checkout.ToString() == "")//Cap nhat checkout xac nhan ra khoi truong
                    {
                        THAMGIA up = db.THAMGIAs.Single(x => x.IDTHAMGIA == Thamdu.IDTHAMGIA);
                        // Nha_GetDaiBieuThamDuOfMaCanBoResult dbiupdate = getDataByCode(txtCode.Text.ToString());

                        // up.IDDAIBIEU = Thamdu.IDCanbo;
                        //up.IDTHAMGIA = Thamdu.IDTHAMGIA;
                        // up.MaCanbo = Thamdu.MaCanbo;
                        up.Checkout = DateTime.Now;
                        up.CardTracking = up.MaCanbo;
                        Canbo cb = db.Canbos.Single(x => x.MaCanbo == Thamdu.MaCanbo);
                        
                        
                        if (cb.MaCanbo.Substring(0,1)=="G")
                            cb.MaCanbo = "G";

                        
                        
                        db.SubmitChanges();
                        RefreshDataGridview();
                        ReloadGridviewKhach();
                        txtCode.Focus();
                        // txtCode.Text = "";
                        //  txtName.Text = "";
                        // txtDepartment.Text = "";

                    }

                }
                //Nha_GetDaiBieuThamDuOfMaCanBoResult dbi = getDataByCode(txtCode.Text);
                THAMGIA tg = new THAMGIA();
                // Nha_GetDaiBieuThamDuOfMaCanBoResult dbi = getDataByCode(txtCode.Text.ToString());// lấy thông tin show lên
                Nha_ShowScreenResult dbi = db.Nha_ShowScreen(MSSCB).FirstOrDefault();
                THAMGIA ups = db.THAMGIAs.Single(x => x.IDTHAMGIA == dbi.IDTHAMGIA);
                if(ups.Checkout != null)
                {
                    ups.MaCanbo = null;
                    db.SubmitChanges();
                }    
               
                if (dbi != null)
                {

                    delegateCheckInOut = dbi;
                    Screen[] screen = Screen.AllScreens;

                    FrameWelcome form2 = FrameWelcome.GetInstance();

                    form2.Show();
                    if (screen.Length > 1)
                    {
                        frm.Left = screen[1].Bounds.Width;
                        frm.Top = screen[1].Bounds.Height;
                        frm.StartPosition = FormStartPosition.Manual;
                        frm.Location = screen[1].WorkingArea.Location;
                        frm.BringToFront();
                        frm.Show();
                    }
                    else
                    {
                        frm.Show();
                    }

                    //if (!IsFormOpen(typeof(FrameWelcome)))
                    //{
                        
                    //    Screen[] screen = Screen.AllScreens;
                       
                    //    if (screen.Length > 1)
                    //    {
                    //        frm.Left = screen[2].Bounds.Width;
                    //        frm.Top = screen[2].Bounds.Height;
                    //        frm.StartPosition = FormStartPosition.Manual;
                    //        frm.Location = screen[2].WorkingArea.Location;
                    //        frm.Show();
                    //    }
                    //    else
                    //    {
                    //        frm.Show();
                    //    }
                    //}
                }
            }
        }

        private void bindingSource1_PositionChanged(object sender, EventArgs e)
        {
            //  txtName.Text = (bindingSource1.Current as Canbo).TenCanbo;
            txtCode.Text = (bindingSource1.Current as Canbo).MaCanbo;
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            lblthoidiem.Text = DateTime.Now.ToString("dd-MM-yyyy - hh:mm:ss");
            if (this.xtraTabControl1.SelectedTabPage != xtraTabPage2)
                txtCode.Focus();

        }

        private void simpleButton5_Click(object sender, EventArgs e)
        {
            using (var f = new VangMatForm())
            {
                f.ShowDialog();
            }
        }

        private void simpleButton3_Click(object sender, EventArgs e)
        {
            DSCanbo ds = new DSCanbo();
            ds.ShowDialog();

        }

        private void xtraTabControl1_Click(object sender, EventArgs e)
        {
        }
        public List<Canbo> KhachItems
        {
            get
            {
                return canboBindingSource.DataSource as List<Canbo>;
            }
            set
            {
                canboBindingSource.DataSource = value;
            }
        }
        private void ThemKhachsimpleButton_Click(object sender, EventArgs e)
        {

            Canbo cb = new Canbo();
            cb.TenCanbo = "Khách";
            cb.Thoigiancapnhat = DateTime.Now;
            cb.IDBomon = 140; //40 Khách
            // db.GetTable<Canbo>().InsertOnSubmit(cb);
            KhachItems.Add(cb);
            db.Canbos.InsertOnSubmit(cb);
            db.SubmitChanges();
            //gridView2.AddNewRow();
            //gridView2.OptionsNavigation.AutoFocusNewRow = true;
            KhachItems = (from Khach in db.Canbos where (Khach.MaCanbo.Substring(0, 1) == "G" || Khach.MaCanbo == null) select Khach).ToList();
            ReloadGridviewKhach();

            //QLKhach_FocusRowandShowEditor();
        }
        private void ReloadGridviewKhach()
        {
            KhachItems = (from Khach in db.Canbos where (Khach.MaCanbo.Substring(0, 1) == "G" || Khach.MaCanbo == null) select Khach).ToList();
            gridControl2.RefreshDataSource();
        }


        private void QLKhach_FocusRowandShowEditor()
        {
            ColumnView cv = gridControl2.MainView as ColumnView;
            cv.FocusedRowHandle = 0;
            gridView1.FocusedRowHandle = DevExpress.XtraGrid.GridControl.NewItemRowHandle;
            gridView1.FocusedColumn = gridView1.VisibleColumns[2];
            gridView1.ShowEditor();
        }

        private void LuuKhachsimpleButton_Click(object sender, EventArgs e)
        {
            Canbo DBCODE = (canboBindingSource.Current as Canbo);
            // Submit the changes to the database.
            db.SubmitChanges();
        }

        private void XoaKhachsimpleButton_Click(object sender, EventArgs e)
        {
            try
            {

                DialogResult dlr = MessageBox.Show("Bạn có chắc chắn xóa không?",
        "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dlr == DialogResult.No) return;
                //@Nha: Delete
                Canbo DBCODE = (canboBindingSource.Current as Canbo);
                //string DBCODE = gridView1.GetRowCellValue(gridView1.FocusedRowHandle, gridView1.Columns[0]).ToString();
                if (gridView2.GetFocusedRow() != null && gridView2.DataRowCount > 0)
                {

                    db.Canbos.DeleteOnSubmit(DBCODE);
                    db.SubmitChanges();
                    this.Focus();
                    ReloadGridviewKhach();
                }
                else
                {
                    MessageBox.Show("Không có dữ liệu để xóa", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
                }

            }catch(Exception ex)
            {
                MessageBox.Show("Xóa không thành công");
            }
    
}

        private void GDTC_Reload_simpleButton_Click(object sender, EventArgs e)
        {
            KhachItems = (from Khach in db.Canbos where (Khach.MaCanbo.Substring(0, 1) == "G" || Khach.MaCanbo == null || Khach.MaCanbo == "NULL" || Khach.MaCanbo == "") select Khach).OrderByDescending(x=>x.IDCanbo).ToList();
            if (KhachItems.Count > 0)
            {
                canboBindingSource.DataSource = KhachItems;
                gridControl2.RefreshDataSource();

            }
        }
    }
}
