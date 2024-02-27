using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

namespace Babyworld.store.App_Code
{
    public class Email
    {
        public bool SendEmail(string toadd, string subject, string msg)
        {
            MailMessage message = new MailMessage();
            SmtpClient client = new SmtpClient();
            try
            {
                string SendingEmail = "", MailServer = "", SendingPassword = "";
                SendingEmail = "babyworldstore3@gmail.com";
                MailServer = "smtp.gmail.com";
                SendingPassword = "babyworld3";
                int ServerPort = 587;

                message.IsBodyHtml = true;

                message.From = new MailAddress(SendingEmail, "Noreply");
                message.To.Add(new MailAddress(toadd.ToString()));

                //if (!string.IsNullOrEmpty(cc))
                //{
                //    message.CC.Add(new MailAddress(cc.ToString()));
                //}

                //if (!string.IsNullOrEmpty(bcc))
                //{
                //    message.Bcc.Add(new MailAddress(bcc.ToString()));
                //}
                //if (attachedfile != null)
                //{
                //    Attachment attach = null;
                //    string[] attachArr = attachedfile.Split('*');
                //    foreach (string obj in attachArr)
                //    {
                //        attach = new System.Net.Mail.Attachment(obj);
                //        message.Attachments.Add(attach);
                //    }
                //}

                message.Body = msg;
                message.Subject = subject;

                client.Host = MailServer;
                client.Port = ServerPort;
                client.EnableSsl = true;
                client.UseDefaultCredentials = true;
                client.Credentials = new System.Net.NetworkCredential(SendingEmail, SendingPassword);
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.Send(message);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                message = null;
                client = null;
            }
        }

    }
}