using System;
using System.IO;
using System.Reflection;
using System.Windows.Forms;
using PayrollSytem.Includes;

namespace PayrollSytem
{
    public partial class frm_reports : Form
    {
        public frm_reports()
        {
            InitializeComponent();
        }

        private SQLConfig config = new SQLConfig();
        private string sql;

        /// <summary>
        /// Loads a report and assigns it to the Crystal Report Viewer.
        /// </summary>
        /// <param name="sql">The SQL query for loading data.</param>
        /// <param name="rptname">The name of the Crystal Report file (without extension).</param>
        private void LoadReport(string sql, string rptname)
        {
            try
            {
                //MessageBox.Show("Starting LoadReport...");

                // Fetch data
                config.loadReports(sql);
                if (config.dt == null || config.dt.Rows.Count == 0)
                {
                    MessageBox.Show("No data found for the SQL query.", "No Data", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    return;
                }

                // Get the root directory of the project
                string rootDirectory = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
                rootDirectory = Directory.GetParent(Directory.GetParent(rootDirectory).FullName).FullName;

                // Construct the report path based on the root directory
                string reportPath = Path.Combine(rootDirectory, "Reports", rptname + ".rpt");
                //MessageBox.Show($"Report Path: {reportPath}");

                if (!File.Exists(reportPath))
                {
                    MessageBox.Show($"Report file not found: {reportPath}", "File Not Found", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // Load and display report
                var reportDoc = new CrystalDecisions.CrystalReports.Engine.ReportDocument();
                reportDoc.Load(reportPath);
                reportDoc.SetDataSource(config.dt);
                crystalReportViewer1.ReportSource = reportDoc;
                crystalReportViewer1.Refresh();
                MessageBox.Show("Report loaded successfully.");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error loading report: {ex.Message}\n\nStack Trace:\n{ex.StackTrace}", "Report Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnweeklypayroll_Click(object sender, EventArgs e)
        {
            sql = @"
                SELECT CONCAT(emp_lname, ' , ', emp_fname) AS FullName,
                       num_days, d_rate, r_wage, overtime, hol_pay, gross_sal,
                       cash_ad, bread_vale, philhealth, deduct1, ded_amount1,
                       deduct2, ded_amount2, deduct3, ded_amount3,
                       total_ded, net_income, dateissued
                FROM employee e
                JOIN employee_workinfo we ON e.emp_code = we.emp_code
                JOIN payroll p ON p.emp_code = e.emp_code
                JOIN other_deduction od ON p.trans_id = od.trans_id";

            LoadReport(sql, "weeklypayroll");
        }

        private void btnPayslip_Click(object sender, EventArgs e)
        {
            sql = @"
                SELECT CONCAT(emp_lname, ' , ', emp_fname) AS FullName,
                       num_days, d_rate, r_wage, overtime, hol_pay, gross_sal,
                       cash_ad, bread_vale, philhealth, pag_ibig,
                       deduct1, ded_amount1, deduct2, ded_amount2,
                       deduct3, ded_amount3, total_ded, net_income, dateissued
                FROM employee e
                JOIN employee_workinfo we ON e.emp_code = we.emp_code
                JOIN payroll p ON p.emp_code = e.emp_code
                JOIN other_deduction od ON p.trans_id = od.trans_id";

            LoadReport(sql, "payslip");
        }

        private void frm_reports_Load(object sender, EventArgs e)
        {
            // Additional initialization code if required.
        }
    }
}
