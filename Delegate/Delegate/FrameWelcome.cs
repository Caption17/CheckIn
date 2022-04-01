using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Text;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using DevExpress.Utils;
using System.Globalization;
using DevExpress.XtraPrinting.BarCode;

namespace Delegate
{
    public partial class FrameWelcome : DevExpress.XtraEditors.XtraForm
    {

        public PrivateFontCollection pfc = new PrivateFontCollection();
        Nha_GetDaiBieuThamDuOfMaCanBoResult Cur = new Nha_GetDaiBieuThamDuOfMaCanBoResult();

        /// <summary>
        /// test
        /// </summary>
        private static FrameWelcome Instance;
        public static FrameWelcome GetInstance()
        {
            if (Instance == null || Instance.IsDisposed)
            {
                Instance = new FrameWelcome();
            }
            else
            {
                Instance.BringToFront();
            }
            return Instance;
        }
        //endtest
        public FrameWelcome()
        {
            InitializeComponent();
            // pfc.AddFontFile(@"E:\font\iCielNovecentosans-DemiBold.otf");
            labelControl1.AllowHtmlString = true;
            labelControl1.Appearance.Options.UseTextOptions = true;
            labelControl1.Appearance.TextOptions.WordWrap = DevExpress.Utils.WordWrap.Wrap;
            labelControl1.Appearance.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
            labelControl1.Text = "";
        }
        public FrameWelcome(Nha_GetDaiBieuThamDuOfMaCanBoResult cur) : this()
        {
            this.Cur = cur;
        }

        private void FrameWelcome_Load(object sender, EventArgs e)
        {
        }

        private void FrameWelcome_Resize(object sender, EventArgs e)
        {

        }

        private void FrameWelcome_SizeChanged(object sender, EventArgs e)
        {

        }


        private void Show(Nha_ShowScreenResult show)
        {
            /*if (CheckInOut.delegateCheckInOut != null)
            {
                string code = CheckInOut.delegateCheckInOut.DBCODE.ToString();
                string s = code.Substring(3);
                int number = int.Parse(s);
                string link = @"E:\PM-Diem-danh-QR-code\AnhDB\" + number.ToString() + @".jpg";
                pictureBox2.Image = Image.FromFile(link);
            }*/

            if (show != null)
            {

                //try
                //{

                string name = show.TenCanbo.ToString().ToLower();

                string depart = show.TenDonvi.ToString().ToLower();
                string code = "";

                code = show.MaCanbo.ToString().ToLower();


                string Checkin = show.Checkin.Value.ToString(" H:mm (dd/MM/yyyy)");

                DateTime? ckout = show.Checkout;
                string Checkout = "-";
                if (ckout != null)
                    Checkout = ckout.Value.ToString(" H:mm (dd/MM/yyyy)");




                string F0Start = show.NgayPhatHienFO;
                string F0End = show.NgayKhoiBenhFO;
                String F0Status = "";
                if ((F0Start == "" && F0End == "") || (F0Start == null && F0End == null))
                {
                    F0Status = "Không";
                }
                else
                {
                    F0Status = "Ngày phát hiện:" + F0Start + "; Ngày khỏi bệnh: " + F0End;
                }
                String ThoidiemXN = "";
                string Mui1 = show.NamHoanthanhDTBDHientai;
                string Mui2 = show.TenKhoaDTBD;
                if (show.Thoidiem != null)
                    ThoidiemXN = show.Thoidiem.Value.ToString(" H:mm (dd/MM/yyyy)");


                //string KetQuaXN = CheckinOut.delegateCheckInOut.KetQua.ToString().ToLower();
                //string NoiXN = CheckinOut.delegateCheckInOut.NoiXetNghiem.ToString();
                // var HoursXN = (DateTime.Now - CheckinOut.delegateCheckInOut.Thoidiem.Value).TotalHours;


                //DateTime myDate1 = CheckinOut.delegateCheckInOut.Thoidiem.Value;
                //DateTime myDate2 = DateTime.Now;
                //TimeSpan difference = myDate2.Subtract(myDate1);
                //double totalHours = difference.TotalHours;

                //String strHieuLucXN = "";
                //if(totalHours < 72)
                //{
                //    strHieuLucXN = "Còn hiệu lực ("+ Math.Round(totalHours,2)+" giờ)";
                //} 
                //else
                //{
                //    strHieuLucXN = "Hết hiệu lực ("+ Math.Round(totalHours, 2)+" giờ)";
                //}    
                //lblHoTen.Text = name.ToUpper();
                string NhaTest = "26/06/2021";
                string NhaTest1 = "09/09/2021";
                string ten = "Trần Thanh Nhã";
                string mscb = "1225";
                string f0 = "Không";
                string KQ = "Âm tính (vào lúc 15h30, 30/9/2021)";
                string ThongTinChung = "THÔNG TIN CHUNG";
                string ThongTinChongDich = "THÔNG TIN PHÒNG, CHỐNG DỊCH BỆNH";
                labelControl1.Text = "<size=40><color=255,255,255>" + ThongTinChung.ToUpper() + "</color></size><br>" +
                    "<size=60><color=255,255,0>" + name.ToUpper() + "</color></size><br>" +
                                      "<size=30><color=255,255,255><b>" + depart.ToUpper() + "</b></color></size><br>" +
                    "<size=40><color=255,255,255><b>MSCB: " + code.ToUpper() + "</b></color></size><br>" +


                      "<size=20><color=255,255,255><b>Thời gian vào: " + "</b></color>" +
                                              "<size=20><color=255,255,0>" + Checkin + "</color></size><br>" +
                         "<size=20><color=255,255,255><b>Thời gian ra: " + "</b></color>" +
                                              "<size=20><color=255,255,0>" + Checkout + "</color></size><br><br><br>" +


                                       "<size=40><color=255,255,255>" + ThongTinChongDich.ToUpper() + "</color></size><br><br>" +

                                         "<size=23><color=255,255,255><b>Tiêm vaccine mũi 1: " + Mui1 + "</b></color></size><br>" +
                                         "<size=23><color=255,255,255><b>Tiêm vaccine mũi 2: " + Mui2 + "</b></color></size><br>" +
                                          "<size=20><color=255,255,255><b>Tình trạng F0: " + F0Status + "</b></color></size><br>" +

                                           //"<size=23><color=255,255,255><b>Kết quả xét nghiệm gần nhất: " + "</b></color>"+
                                           //"<size=23><color=255,255,0>" + KetQuaXN + "</color></size><br>" +

                                           //"<size=23><color=255,255,255><b>Nơi xét nghiệm: " + "</b></color>" +
                                           //   "<size=23><color=255,255,0>" + NoiXN + "</color></size><br>" +


                                           //"<size=23><color=255,255,255><b>Thời gian có kết quả xét nghiệm: " + "</b></color>" +
                                           // "<size=23><color=255,255,0>" + ThoidiemXN + "</color></size><br>" +


                                           // "<size=23><color=255,255,255><b>Hiệu lực: " + "</b></color>" +
                                           //  "<size=23><color=255,255,0>" + strHieuLucXN + "</color></size><br>" +
                                           "<size=23><color=255,0,0>........................................</color></size>"
                                           ;

                //}
                //catch (Exception e1)
                //{
                //    Console.WriteLine(e1);

                //}
            }

        }
        DelegateFastdbDataContext db = new DelegateFastdbDataContext();
        private void labelControl1_Click(object sender, EventArgs e)
        {

        }
        string MSSCB;
        private void txtCodeShow_KeyDown(object sender, KeyEventArgs e)
        {

            if (e.KeyData == Keys.F6)
            {
                txtCodeShow.Focus();
                //txtCode.Text = "";
                //txtName.Text = "";
                // txtDepartment.Text = "";
            }
            if (e.KeyData == Keys.Enter)
            {
                MSSCB = txtCodeShow.Text.Trim();
                if (MSSCB == "max") this.WindowState = FormWindowState.Maximized;
                if (MSSCB == "min") this.WindowState = FormWindowState.Minimized;
                //tim xem MCB nay ton tai khong
                Canbo CanboCur = (from cb in db.Canbos where cb.MaCanbo == txtCodeShow.Text select cb).FirstOrDefault();

                if (CanboCur == null)
                {
                    // MessageBox.Show("Không tìm thấy thông tin viên chức!!!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
                    txtCodeShow.Focus();
                    txtCodeShow.Text = "";
                    //lblinfo.Text = "Không tìm thấy";
                    // RefreshDataGridview();
                    return;
                }


                if (CanboCur != null)// neu ton tai trong Canbo
                {
                    //IDCanbo = CanboCur.IDCanbo;
                    // Lay du lieu kiem tra xem co checkin chua.
                    // Nha_GetDaiBieuThamDuOfMaCanBoResult Thamgia = getDataByCode(txtCode.Text);
                    Nha_GetMaxNgayCheckinOFDaiBieuResult Thamdu = db.Nha_GetMaxNgayCheckinOFDaiBieu(txtCodeShow.Text).FirstOrDefault();
                    if (Thamdu == null)//thêm mới
                    {
                        THAMGIA add = new THAMGIA();
                        Canbo dbiinsert = (from ab in db.Canbos where ab.MaCanbo == txtCodeShow.Text select ab).FirstOrDefault();
                        add.IDDAIBIEU = dbiinsert.IDCanbo;
                        add.MaCanbo = dbiinsert.MaCanbo;
                        add.Checkin = DateTime.Now;
                        // add.Checkout = "-";
                        db.THAMGIAs.InsertOnSubmit(add);
                        db.SubmitChanges();
                        // RefreshDataGridview();
                        txtCodeShow.Focus();
                        // txtCode.Text = "";
                        //txtName.Text = "";
                        // txtDepartment.Text = "";
                    }
                    else if (Thamdu.Checkin != null && Thamdu.Checkout != null)//thêm mới
                    {
                        THAMGIA add = new THAMGIA();
                        Canbo dbiinsert = (from ab in db.Canbos where ab.MaCanbo == txtCodeShow.Text select ab).FirstOrDefault();
                        add.IDDAIBIEU = dbiinsert.IDCanbo;

                        add.MaCanbo = dbiinsert.MaCanbo;
                        add.Checkin = DateTime.Now;
                        //add.Checkout = "-";
                        db.THAMGIAs.InsertOnSubmit(add);
                        db.SubmitChanges();
                        //RefreshDataGridview();
                        txtCodeShow.Focus();

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
                        up.CardTracking = up.MaCanbo+"VC";
                        Canbo cb = db.Canbos.Single(x => x.MaCanbo == Thamdu.MaCanbo);


                        if (cb.MaCanbo.Substring(0, 1) == "G")
                            cb.MaCanbo = "G";



                        db.SubmitChanges();
                        //RefreshDataGridview();
                        //ReloadGridviewKhach();
                        txtCodeShow.Focus();
                        // txtCode.Text = "";
                        //  txtName.Text = "";
                        // txtDepartment.Text = "";

                    }

                }
                //Nha_GetDaiBieuThamDuOfMaCanBoResult dbi = getDataByCode(txtCode.Text);
                //THAMGIA tg = new THAMGIA();
                // Nha_GetDaiBieuThamDuOfMaCanBoResult dbi = getDataByCode(txtCode.Text.ToString());// lấy thông tin show lên
                try
                {
                    Nha_ShowScreenResult dbi = db.Nha_ShowScreen(MSSCB).FirstOrDefault();
                    THAMGIA ups = db.THAMGIAs.Single(x => x.IDTHAMGIA == dbi.IDTHAMGIA);
                    if (ups.Checkout != null)
                    {
                        ups.MaCanbo = null;
                        db.SubmitChanges();

                    }
                    txtCodeShow.Text = null;
                    if (dbi != null)
                    {

                        Show(dbi);


                    }
                }catch
                {
                    Application.Restart();
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
}
