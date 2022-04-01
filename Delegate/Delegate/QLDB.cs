using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using System.Globalization;
using System.Collections;

namespace Delegate
{
    public partial class QLDB : DevExpress.XtraEditors.XtraForm
    {
            
        private string Excel03ConString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source={0};Extended Properties='Excel 8.0;HDR={1}'";
        private string Excel07ConString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties='Excel 8.0;HDR={1}'";
        string conStr, sheetName;
        public QLDB()
        {
            InitializeComponent();
        }

        private void QLDB_Load(object sender, EventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void buttonEdit1_EditValueChanged(object sender, EventArgs e)
        {

        }

        private void buttonEdit1_Click(object sender, EventArgs e)
        {
            OpenFileDialog openfileDiag = new OpenFileDialog();
            openfileDiag.Filter = "Microsof Excel 2007 - 2016|*.xlsx|All Files | *.*";
            openfileDiag.Title = "Chọn Excel File";
            if (openfileDiag.ShowDialog() == DialogResult.OK)
            {
                gridControl1.DataSource = null;
                string filePath = openfileDiag.FileName;
                buttonEdit1.Text = filePath.ToString();
                string extension = Path.GetExtension(filePath);
                string header = radioButton1.Checked ? "YES" : "NO";
                conStr = string.Empty;
                switch (extension)
                {

                    case ".xls": //Excel 97-03
                        conStr = string.Format(Excel03ConString, filePath, header);
                        break;

                    case ".xlsx": //Excel 07
                        conStr = string.Format(Excel07ConString, filePath, header);
                        break;
                }

                using (OleDbConnection con = new OleDbConnection(conStr))
                {
                    try
                    {
                        using (OleDbCommand cmd = new OleDbCommand())
                        {
                            cmd.Connection = con;
                            con.Open();
                            DataTable dtExcelSchema = con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                            sheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();
                            con.Close();
                        }
                    }
                    catch (OleDbException ex)
                    {
                        MessageBox.Show("Lỗi: " + ex.ToString(), "Thông báo lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }

                try
                {
                    using (OleDbConnection con = new OleDbConnection(conStr))
                    {
                        using (OleDbCommand cmd = new OleDbCommand())
                        {
                            using (OleDbDataAdapter oda = new OleDbDataAdapter())
                            {
                                DataTable dt = new DataTable();
                                cmd.CommandText = "SELECT * From [" + sheetName + "]";
                                cmd.Connection = con;
                                con.Open();
                                oda.SelectCommand = cmd;
                                oda.Fill(dt);
                                con.Close();
                                gridControl1.DataSource = dt;
                            }
                        }
                    }
                }
                catch (OleDbException ex)
                {
                    MessageBox.Show("Lỗi: " + ex.ToString(), "Thông báo lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

            }
        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {
            gridControl1.DataSource = null;
            buttonEdit1_Click(this, new EventArgs());
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            DelegateFastdbDataContext db = new DelegateFastdbDataContext();
            DialogResult dlr = MessageBox.Show("Bạn có muốn import dữ liệu này không? Nếu có thì hệ thống sẽ xóa toàn bộ dữ liệu cũ và thêm vào dữ liệu mới này?",
     "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dlr == DialogResult.No) return;
             
            if(gridView1.RowCount >0)
            {
               // var lamDaiBieu = from p in db.Canbos where p.IDDAIBIEU > 0 select p;
                //db.Canbos.DeleteAllOnSubmit(lamDaiBieu);
                //db.SubmitChanges();
            }    
            
            for (int i = 0; i < gridView1.RowCount; i++)
            {
                try
                {
                    Canbo daibieu = new Canbo();
                    string code = gridView1.GetRowCellValue(i, gridView1.Columns[0]).ToString();
                    string name = gridView1.GetRowCellValue(i, gridView1.Columns[1]).ToString();
                    string department = gridView1.GetRowCellValue(i, gridView1.Columns[2]).ToString();
                   // daibieu.DBCODE = code;
                   // daibieu.DBNAME = name;
                   // daibieu.DONVINAME = department;
                    
                   // db.DAIBIEUs.InsertOnSubmit(daibieu);
                    

                   // db.SubmitChanges();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi: " + ex.ToString() + i, "Thông báo lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
            }
            MessageBox.Show("Thành công!");

        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
