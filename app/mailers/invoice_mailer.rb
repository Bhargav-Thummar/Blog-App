class InvoiceMailer < ApplicationMailer
  def new_invoice_email
    @user = User.first

    pdf_html = ActionController::Base.new.render_to_string(template: 'pdfs/invoice', layout: 'pdf', locals: { user: @user } )
    pdf = WickedPdf.new.pdf_from_string(pdf_html)

    # pdf = WickedPdf.new.pdf_from_string('<h1>Hello There!</h1>')
    attachments["abc.pdf"] = pdf

    mail(to: "developer.bhargavthummar@gmail.com", subject: "You got a new invoice!")
  end
end
