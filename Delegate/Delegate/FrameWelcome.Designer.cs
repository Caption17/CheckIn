namespace Delegate
{
    partial class FrameWelcome
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrameWelcome));
            this.labelControl1 = new DevExpress.XtraEditors.LabelControl();
            this.txtCodeShow = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // labelControl1
            // 
            this.labelControl1.Appearance.Font = new System.Drawing.Font("Microsoft Sans Serif", 30F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl1.Appearance.Options.UseFont = true;
            this.labelControl1.Location = new System.Drawing.Point(448, 307);
            this.labelControl1.Name = "labelControl1";
            this.labelControl1.Size = new System.Drawing.Size(660, 46);
            this.labelControl1.TabIndex = 5;
            this.labelControl1.Text = ".......................................................";
            this.labelControl1.Click += new System.EventHandler(this.labelControl1_Click);
            // 
            // txtCodeShow
            // 
            this.txtCodeShow.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.txtCodeShow.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.txtCodeShow.Font = new System.Drawing.Font("Tahoma", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCodeShow.ForeColor = System.Drawing.Color.Red;
            this.txtCodeShow.Location = new System.Drawing.Point(600, 695);
            this.txtCodeShow.Name = "txtCodeShow";
            this.txtCodeShow.Size = new System.Drawing.Size(175, 40);
            this.txtCodeShow.TabIndex = 6;
            this.txtCodeShow.Text = " ";
            this.txtCodeShow.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtCodeShow_KeyDown);
            // 
            // FrameWelcome
            // 
            this.AllowDrop = true;
            this.Appearance.Options.UseTextOptions = true;
            this.Appearance.TextOptions.WordWrap = DevExpress.Utils.WordWrap.Wrap;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.BackgroundImageLayoutStore = System.Windows.Forms.ImageLayout.Stretch;
            this.BackgroundImageStore = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImageStore")));
            this.ClientSize = new System.Drawing.Size(1376, 756);
            this.Controls.Add(this.txtCodeShow);
            this.Controls.Add(this.labelControl1);
            this.DoubleBuffered = true;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.IconOptions.Icon = ((System.Drawing.Icon)(resources.GetObject("FrameWelcome.IconOptions.Icon")));
            this.ImeMode = System.Windows.Forms.ImeMode.Close;
            this.Name = "FrameWelcome";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Chào mừng viên chức";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.FrameWelcome_Load);
            this.SizeChanged += new System.EventHandler(this.FrameWelcome_SizeChanged);
            this.Resize += new System.EventHandler(this.FrameWelcome_Resize);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private DevExpress.XtraEditors.LabelControl labelControl1;
        private System.Windows.Forms.TextBox txtCodeShow;
    }
}