

#library(webr)


#library(plyr)
library(readxl)
#library(openxlsx)
#library(data.table)
library(shiny)
#library(shinyAce)
#source("chooser.R")

#library(lavaan)

#library(mnormt)
#library(curl)
#library(plspm)


########################################
########UI (User Interface)#############
########################################

modul_literature_review_ui <- function(id) {
  
  
  
  ns <- NS(id)
  
  fluidPage(
  
    
    
    
    tabsetPanel(
      
      tabPanel(title = tags$h5( tags$img(src = "icon_select.gif", width = "30px"), 'Pilih Topik'),
               
               
               uiOutput(ns("radio_button_pilih_topik")),
               
               br()
               
               
      ), #Akhir tabpanel pilih topik
      
      
      tabPanel(title = tags$h5( tags$img(src = "icon_literatur.gif", width = "30px"), 'Data Referensi'),
               
               
               uiOutput(ns("buka_pemilihan_informasi_hargasaham_endogen_plssem")),
               DT::DTOutput(ns("buka_data_hargasaham_endogen_plssem")),
               
               
               uiOutput(ns("buka_pemilihan_informasi_roa_terhadap_hargasaham")),
               DT::DTOutput(ns("buka_data_roa_terhadap_hargasaham")),
               
               
               uiOutput(ns("buka_pemilihan_informasi_roa_terhadap_hargasaham_plssem_smartpls")),
               DT::DTOutput(ns("buka_data_roa_terhadap_hargasaham_plssem_smartpls")),
               
               
               uiOutput(ns("buka_pemilihan_informasi_der_terhadap_hargasaham_plssem_smartpls")),
               DT::DTOutput(ns("buka_data_der_terhadap_hargasaham_plssem_smartpls")),
            
               
               uiOutput(ns("buka_pemilihan_informasi_dpr_terhadap_hargasaham_plssem_smartpls")),
               DT::DTOutput(ns("buka_data_dpr_terhadap_hargasaham_plssem_smartpls")),   
               
               
               
               
               uiOutput(ns("buka_pemilihan_informasi_eps_terhadap_hargasaham_plssem_smartpls")),
               DT::DTOutput(ns("buka_data_eps_terhadap_hargasaham_plssem_smartpls")),   
               
               
               
               uiOutput(ns("buka_pemilihan_informasi_roe_terhadap_hargasaham_plssem_smartpls")),
               DT::DTOutput(ns("buka_data_roe_terhadap_hargasaham_plssem_smartpls")),   
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               uiOutput(ns("buka_pemilihan_informasi_roa_terhadap_kebijakandividen_plssem_smartpls")),
               DT::DTOutput(ns("buka_data_roa_terhadap_kebijakandividen_plssem_smartpls")),
               
               
               uiOutput(ns("buka_pemilihan_informasi_der_terhadap_kebijakandividen_plssem_smartpls")),
               DT::DTOutput(ns("buka_data_der_terhadap_kebijakandividen_plssem_smartpls")),
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               br()
               
               
      ) #Akhir tabpanel data referensi
      
      
      
    ), #Akhir tabsetpanel
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
      
    
    
    
    
    br(),
    

    
    
    
    
   # uiOutput(ns("buka_pemilihan_informasi_Kumpulan_Artikel_di_Jurnal_dengan_Metode_Analisis_Data_PLSSEM")),
    
    
    #uiOutput(ns("buka_pemilihan_informasi")),
    
  
    br(),
    
    
    #DT::DTOutput(ns("buka_data")),


               

    
    
    br(),
    
    
    #DT::DTOutput(ns("buka_data")),

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    br()
    
  ) #Akhir Fluidpage
  
  
} #Akhir dari modul_literature_review_ui

#Akhir dari modul_literature_review_ui
#Akhir dari modul_literature_review_ui
#Akhir dari modul_literature_review_ui
#Akhir dari modul_literature_review_ui











































































########################################
################Server##################
########################################



modul_literature_review_server <- function(input, output, session) {
  
  
  
  nama_topik <- function()
  {
    
    
    nama_topik <- c("Harga Saham sebagai Variabel Endogen (PLS-SEM, SmartPLS) (16 Artikel)",
                    
                    "Return on Asset (ROA) terhadap Harga Saham (30 Artikel)",
  
                    "Return on Asset (ROA) terhadap Harga Saham (PLS-SEM, SmartPLS) (1 Artikel)",
                    
                    "Debt to Equity Ratio (DER) terhadap Harga Saham (PLS-SEM, SmartPLS) (2 Artikel)",
                    
                    "Kebijakan Dividen terhadap Harga Saham (PLS-SEM, SmartPLS) (1 Artikel)",
                    
                    
                    "Earning per Share (EPS) terhadap Harga Saham (PLS-SEM, SmartPLS) (1 Artikel)",
                    
                    
                    "Return on Equity (ROE) terhadap Harga Saham (PLS-SEM, SmartPLS) (1 Artikel)",
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    "Return on Asset (ROA) terhadap Kebijakan Dividen (PLS-SEM, SmartPLS) (1 Artikel)",
                    
                    "Debt to Equity Ratio (DER) terhadap Kebijakan Dividen (PLS-SEM, SmartPLS) (1 Artikel)"
                    
                 
                    )
    
    
    
  }
  
  
  output$radio_button_pilih_topik <- renderUI({
    
    
    
    
    
    
    radioButtons(session$ns("terpilih_topik_paper"), 
                       label="Pilih Topik:", choices = c(nama_topik()), 
                       selected=c("Harga Saham sebagai Variabel Endogen (PLS-SEM, SmartPLS) (16 Artikel)"), inline = FALSE)
    
    
    
  })
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  #########################
  #########################
  
  
  nama_variabel_hargasaham_endogen_plssem <- function()
  {
    
    dat <- read_xlsx("harga saham sebagai endogen, plssem gunakan.xlsx")
    dat <- as.data.frame(dat)
    
    nama <- colnames(dat)
    
    return(nama)
    
    
  }
  
  
  
  
  
  
  
  output$buka_pemilihan_informasi_hargasaham_endogen_plssem <- renderUI({
    
    
      
      if(input$terpilih_topik_paper == "Harga Saham sebagai Variabel Endogen (PLS-SEM, SmartPLS) (16 Artikel)")
      {
      
      
      checkboxGroupInput(session$ns("terpilih_variabel_hargasaham_endogen_plssem"), 
                         label="Pilih Variabel:", choices = c(nama_variabel_hargasaham_endogen_plssem()), 
                         selected=c("Jurnal/Prosiding", "Nama Jurnal/Prosiding", "Judul Artikel", "Tahun Artikel", "Author", "Variabel yang Menuju ke Harga Saham", "Ada Variabel Laten dengan Jumlah Indikator > 1?" ), inline = TRUE)
        
        
      }
      
      
  
  })
  
  
  
  
  
  ##################
  
  
  
  
  
  output$buka_data_hargasaham_endogen_plssem <- DT::renderDT({
    
    
    if(input$terpilih_topik_paper == "Harga Saham sebagai Variabel Endogen (PLS-SEM, SmartPLS) (16 Artikel)")
    {
   
    dat <- read_xlsx("harga saham sebagai endogen, plssem gunakan.xlsx")
    dat <- as.data.frame(dat)
    
    nama <- colnames(dat)
    
    
    terpilih_variabel_hargasaham_endogen_plssem <- input$terpilih_variabel_hargasaham_endogen_plssem
    
    dat_baru <- dat[c(terpilih_variabel_hargasaham_endogen_plssem)]
    
    print(dat_baru)
    
    
    }

    
  })
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  "Return on Asset (ROA) terhadap Harga Saham (30 Artikel)"
  
  
  
  
  
  
  
  
  #########################
  #########################
  
  
  nama_variabel_roa_terhadap_hargasaham <- function()
  {
    
    dat <- read_xlsx("ROA terhadap Harga Saham Gunakan.xlsx")
    dat <- as.data.frame(dat)
    
    nama <- colnames(dat)
    
    return(nama)
    
    
  }
  
  
  
  
  
  
  
  output$buka_pemilihan_informasi_roa_terhadap_hargasaham <- renderUI({
    
    
    
    if(input$terpilih_topik_paper == "Return on Asset (ROA) terhadap Harga Saham (30 Artikel)")
    {
      
      
      checkboxGroupInput(session$ns("terpilih_variabel_roa_terhadap_hargasaham"), 
                         label="Pilih Variabel:", choices = c(nama_variabel_roa_terhadap_hargasaham()), 
                         selected=c("Judul Artikel", "Tahun", "Author", "Software", "Variabel yang Menuju ke Harga Saham", "Hasil ROA", "Nama Jurnal/Prosiding" ), inline = TRUE)
      
      
    }
    
    
    
  })
  
  
  
  
  
  ##################
  
  
  
  
  
  output$buka_data_roa_terhadap_hargasaham <- DT::renderDT({
    
    
    if(input$terpilih_topik_paper == "Return on Asset (ROA) terhadap Harga Saham (30 Artikel)")
    {
      
      dat <- read_xlsx("ROA terhadap Harga Saham Gunakan.xlsx")
      dat <- as.data.frame(dat)
      
      nama <- colnames(dat)
      
      
      terpilih_variabel_roa_terhadap_hargasaham <- input$terpilih_variabel_roa_terhadap_hargasaham
      
      dat_baru <- dat[c(terpilih_variabel_roa_terhadap_hargasaham)]
      
      print(dat_baru)
      
      
    }
    
    
  })
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  #########################
  #########################
  
  
  nama_variabel_roa_terhadap_hargasaham_plssem_smartpls <- function()
  {
    
    dat <- read_xlsx("ROA TERHADAP HARGA SAHAM, PLSSEM SMARTPLS.xlsx")
    dat <- as.data.frame(dat)
    
    nama <- colnames(dat)
    
    return(nama)
    
    
  }
  
  
  
  
  
  
  
  output$buka_pemilihan_informasi_roa_terhadap_hargasaham_plssem_smartpls <- renderUI({
    
    
    
    if(input$terpilih_topik_paper == "Return on Asset (ROA) terhadap Harga Saham (PLS-SEM, SmartPLS) (1 Artikel)")
    {
      
      
      checkboxGroupInput(session$ns("terpilih_variabel_roa_terhadap_hargasaham_plssem_smartpls"), 
                         label="Pilih Variabel:", choices = c(nama_variabel_roa_terhadap_hargasaham_plssem_smartpls()), 
                         selected=c("Jurnal/Prosiding", "Judul Artikel", "Tahun", "Author", "Sinta", "Scopus", "Variabel Menuju ke Harga Saham", "Hasil" ), inline = TRUE)
      
      
    }
    
    
    
  })
  
  
  
  
  
  ##################
  
  
  
  
  
  output$buka_data_roa_terhadap_hargasaham_plssem_smartpls <- DT::renderDT({
    
    
    if(input$terpilih_topik_paper == "Return on Asset (ROA) terhadap Harga Saham (PLS-SEM, SmartPLS) (1 Artikel)")
    {
      
      dat <- read_xlsx("ROA TERHADAP HARGA SAHAM, PLSSEM SMARTPLS.xlsx")
      dat <- as.data.frame(dat)
      
      nama <- colnames(dat)
      
      
      terpilih_variabel_roa_terhadap_hargasaham_plssem_smartpls <- input$terpilih_variabel_roa_terhadap_hargasaham_plssem_smartpls
      
      dat_baru <- dat[c(terpilih_variabel_roa_terhadap_hargasaham_plssem_smartpls)]
      
      print(dat_baru)
      
      
    }
    
    
  })
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  #########################
  #########################
  
  
  nama_variabel_der_terhadap_hargasaham_plssem_smartpls <- function()
  {
    
    dat <- read_xlsx("DER TERHADAP HARGA SAHAM, PLSSEM SMARTPLS.xlsx")
    dat <- as.data.frame(dat)
    
    nama <- colnames(dat)
    
    return(nama)
    
    
  }
  
  
  
  
  
  
  
  output$buka_pemilihan_informasi_der_terhadap_hargasaham_plssem_smartpls <- renderUI({
    
    
    
    if(input$terpilih_topik_paper == "Debt to Equity Ratio (DER) terhadap Harga Saham (PLS-SEM, SmartPLS) (2 Artikel)")
    {
      
      
      checkboxGroupInput(session$ns("terpilih_variabel_der_terhadap_hargasaham_plssem_smartpls"), 
                         label="Pilih Variabel:", choices = c(nama_variabel_der_terhadap_hargasaham_plssem_smartpls()), 
                         selected=c("Jurnal/Prosiding", "Judul Artikel", "Tahun", "Author", "Sinta", "Scopus", "Variabel Menuju ke Harga Saham", "Hasil" ), inline = TRUE)
      
      
    }
    
    
    
  })
  
  
  
  
  
  ##################
  
  
  
  
  
  output$buka_data_der_terhadap_hargasaham_plssem_smartpls <- DT::renderDT({
    
    
    if(input$terpilih_topik_paper == "Debt to Equity Ratio (DER) terhadap Harga Saham (PLS-SEM, SmartPLS) (2 Artikel)")
    {
      
      dat <- read_xlsx("DER TERHADAP HARGA SAHAM, PLSSEM SMARTPLS.xlsx")
      dat <- as.data.frame(dat)
      
      nama <- colnames(dat)
      
      
      terpilih_variabel_der_terhadap_hargasaham_plssem_smartpls <- input$terpilih_variabel_der_terhadap_hargasaham_plssem_smartpls
      
      dat_baru <- dat[c(terpilih_variabel_der_terhadap_hargasaham_plssem_smartpls)]
      
      print(dat_baru)
      
      
    }
    
    
  })
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  #########################
  #########################
  
  
  nama_variabel_kebijakandividen_terhadap_hargasaham_plssem_smartpls <- function()
  {
    
    dat <- read_xlsx("DPR TERHADAP HARGA SAHAM, PLSSEM SMARTPLS.xlsx")
    dat <- as.data.frame(dat)
    
    nama <- colnames(dat)
    
    return(nama)
    
    
  }
  
  
  
  
  
  
  
  output$buka_pemilihan_informasi_dpr_terhadap_hargasaham_plssem_smartpls <- renderUI({
    
    
    
    if(input$terpilih_topik_paper == "Kebijakan Dividen terhadap Harga Saham (PLS-SEM, SmartPLS) (1 Artikel)")
    {
      
      
      checkboxGroupInput(session$ns("terpilih_variabel_kebijakandividen_terhadap_hargasaham_plssem_smartpls"), 
                         label="Pilih Variabel:", choices = c(nama_variabel_kebijakandividen_terhadap_hargasaham_plssem_smartpls()), 
                         selected=c("Jurnal/Prosiding", "Judul Artikel", "Tahun", "Author", "Sinta", "Scopus", "Variabel Menuju ke Harga Saham", "Hasil" ), inline = TRUE)
      
      
    }
    
    
    
  })
  
  
  
  
  
  ##################
  
  
  
  
  
  output$buka_data_dpr_terhadap_hargasaham_plssem_smartpls <- DT::renderDT({
    
    
    if(input$terpilih_topik_paper == "Kebijakan Dividen terhadap Harga Saham (PLS-SEM, SmartPLS) (1 Artikel)")
    {
      
      dat <- read_xlsx("DPR TERHADAP HARGA SAHAM, PLSSEM SMARTPLS.xlsx")
      dat <- as.data.frame(dat)
      
      nama <- colnames(dat)
      
      
      terpilih_variabel_kebijakandividen_terhadap_hargasaham_plssem_smartpls <- input$terpilih_variabel_kebijakandividen_terhadap_hargasaham_plssem_smartpls
      
      dat_baru <- dat[c(terpilih_variabel_kebijakandividen_terhadap_hargasaham_plssem_smartpls)]
      
      print(dat_baru)
      
      
    }
    
    
  })
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  #########################
  #########################
  
  
  nama_variabel_roa_terhadap_kebijakandividen_plssem_smartpls <- function()
  {
    
    dat <- read_xlsx("ROA TERHADAP KEBIJAKAN DIVIDEN, PLSSEM SMARTPLS.xlsx")
    dat <- as.data.frame(dat)
    
    nama <- colnames(dat)
    
    return(nama)
    
    
  }
  
  
  
  
  
  
  
  output$buka_pemilihan_informasi_roa_terhadap_kebijakandividen_plssem_smartpls <- renderUI({
    
    
    
    if(input$terpilih_topik_paper == "Return on Asset (ROA) terhadap Kebijakan Dividen (PLS-SEM, SmartPLS) (1 Artikel)")
    {
      
      
      checkboxGroupInput(session$ns("terpilih_variabel_roa_terhadap_kebijakandividen_plssem_smartpls"), 
                         label="Pilih Variabel:", choices = c(nama_variabel_roa_terhadap_kebijakandividen_plssem_smartpls()), 
                         selected=c("Jurnal/Prosiding", "Judul Artikel", "Tahun", "Author", "Sinta", "Scopus", "Variabel Menuju ke Harga Saham", "Hasil" ), inline = TRUE)
      
      
    }
    
    
    
  })
  
  
  
  
  
  ##################
  
  
  
  
  
  output$buka_data_roa_terhadap_kebijakandividen_plssem_smartpls <- DT::renderDT({
    
    
    if(input$terpilih_topik_paper == "Return on Asset (ROA) terhadap Kebijakan Dividen (PLS-SEM, SmartPLS) (1 Artikel)")
    {
      
      dat <- read_xlsx("ROA TERHADAP KEBIJAKAN DIVIDEN, PLSSEM SMARTPLS.xlsx")
      dat <- as.data.frame(dat)
      
      nama <- colnames(dat)
      
      
      terpilih_variabel_roa_terhadap_kebijakandividen_plssem_smartpls <- input$terpilih_variabel_roa_terhadap_kebijakandividen_plssem_smartpls
      
      dat_baru <- dat[c(terpilih_variabel_roa_terhadap_kebijakandividen_plssem_smartpls)]
      
      print(dat_baru)
      
      
    }
    
    
  })
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  #########################
  #########################
  
  
  nama_variabel_der_terhadap_kebijakandividen_plssem_smartpls <- function()
  {
    
    dat <- read_xlsx("DER TERHADAP KEBIJAKAN DIVIDEN, PLSSEM SMARTPLS.xlsx")
    dat <- as.data.frame(dat)
    
    nama <- colnames(dat)
    
    return(nama)
    
    
  }
  
  
  
  
  
  
  
  output$buka_pemilihan_informasi_der_terhadap_kebijakandividen_plssem_smartpls <- renderUI({
    
    
    
    if(input$terpilih_topik_paper == "Debt to Equity Ratio (DER) terhadap Kebijakan Dividen (PLS-SEM, SmartPLS) (1 Artikel)")
    {
      
      
      checkboxGroupInput(session$ns("terpilih_variabel_der_terhadap_kebijakandividen_plssem_smartpls"), 
                         label="Pilih Variabel:", choices = c(nama_variabel_der_terhadap_kebijakandividen_plssem_smartpls()), 
                         selected=c("Jurnal/Prosiding", "Judul Artikel", "Tahun", "Author", "Sinta", "Scopus", "Variabel Menuju ke Harga Saham", "Hasil" ), inline = TRUE)
      
      
    }
    
    
    
  })
  
  
  
  
  
  ##################
  
  
  
  
  
  output$buka_data_der_terhadap_kebijakandividen_plssem_smartpls <- DT::renderDT({
    
    
    if(input$terpilih_topik_paper == "Debt to Equity Ratio (DER) terhadap Kebijakan Dividen (PLS-SEM, SmartPLS) (1 Artikel)")
    {
      
      dat <- read_xlsx("DER TERHADAP KEBIJAKAN DIVIDEN, PLSSEM SMARTPLS.xlsx")
      dat <- as.data.frame(dat)
      
      nama <- colnames(dat)
      
      
      terpilih_variabel_der_terhadap_kebijakandividen_plssem_smartpls <- input$terpilih_variabel_der_terhadap_kebijakandividen_plssem_smartpls
      
      dat_baru <- dat[c(terpilih_variabel_der_terhadap_kebijakandividen_plssem_smartpls)]
      
      print(dat_baru)
      
      
    }
    
    
  })
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  #########################
  #########################
  
  
  nama_variabel_eps_terhadap_hargasaham_plssem_smartpls <- function()
  {
    
    dat <- read_xlsx("EPS TERHADAP HARGA SAHAM, PLSSEM SMARTPLS.xlsx")
    dat <- as.data.frame(dat)
    
    nama <- colnames(dat)
    
    return(nama)
    
    
  }
  
  
  
  
  
  
  
  output$buka_pemilihan_informasi_eps_terhadap_hargasaham_plssem_smartpls <- renderUI({
    
    
    
    if(input$terpilih_topik_paper == "Earning per Share (EPS) terhadap Harga Saham (PLS-SEM, SmartPLS) (1 Artikel)")
    {
      
      
      checkboxGroupInput(session$ns("terpilih_variabel_eps_terhadap_hargasaham_plssem_smartpls"), 
                         label="Pilih Variabel:", choices = c(nama_variabel_eps_terhadap_hargasaham_plssem_smartpls()), 
                         selected=c("Jurnal/Prosiding", "Judul Artikel", "Tahun", "Author", "Sinta", "Scopus", "Variabel Menuju ke Harga Saham", "Hasil" ), inline = TRUE)
      
      
    }
    
    
    
  })
  
  
  
  
  
  ##################
  
  
  
  
  
  output$buka_data_eps_terhadap_hargasaham_plssem_smartpls <- DT::renderDT({
    
    
    if(input$terpilih_topik_paper == "Earning per Share (EPS) terhadap Harga Saham (PLS-SEM, SmartPLS) (1 Artikel)")
    {
      
      dat <- read_xlsx("EPS TERHADAP HARGA SAHAM, PLSSEM SMARTPLS.xlsx")
      dat <- as.data.frame(dat)
      
      nama <- colnames(dat)
      
      
      terpilih_variabel_eps_terhadap_hargasaham_plssem_smartpls <- input$terpilih_variabel_eps_terhadap_hargasaham_plssem_smartpls
      
      dat_baru <- dat[c(terpilih_variabel_eps_terhadap_hargasaham_plssem_smartpls)]
      
      print(dat_baru)
      
      
    }
    
    
  })
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  #########################
  #########################
  
  
  nama_variabel_roe_terhadap_hargasaham_plssem_smartpls <- function()
  {
    
    dat <- read_xlsx("ROE TERHADAP HARGA SAHAM, PLSSEM SMARTPLS.xlsx")
    dat <- as.data.frame(dat)
    
    nama <- colnames(dat)
    
    return(nama)
    
    
  }
  
  
  
  
  
  
  
  output$buka_pemilihan_informasi_roe_terhadap_hargasaham_plssem_smartpls <- renderUI({
    
    
    
    if(input$terpilih_topik_paper == "Return on Equity (ROE) terhadap Harga Saham (PLS-SEM, SmartPLS) (1 Artikel)")
    {
      
      
      checkboxGroupInput(session$ns("terpilih_variabel_roe_terhadap_hargasaham_plssem_smartpls"), 
                         label="Pilih Variabel:", choices = c(nama_variabel_roe_terhadap_hargasaham_plssem_smartpls()), 
                         selected=c("Jurnal/Prosiding", "Judul Artikel", "Tahun", "Author", "Sinta", "Scopus", "Variabel Menuju ke Harga Saham", "Hasil" ), inline = TRUE)
      
      
    }
    
    
    
  })
  
  
  
  
  
  ##################
  
  
  
  
  
  output$buka_data_roe_terhadap_hargasaham_plssem_smartpls <- DT::renderDT({
    
    
    if(input$terpilih_topik_paper == "Return on Equity (ROE) terhadap Harga Saham (PLS-SEM, SmartPLS) (1 Artikel)")
    {
      
      dat <- read_xlsx("ROE TERHADAP HARGA SAHAM, PLSSEM SMARTPLS.xlsx")
      dat <- as.data.frame(dat)
      
      nama <- colnames(dat)
      
      
      terpilih_variabel_roe_terhadap_hargasaham_plssem_smartpls <- input$terpilih_variabel_roe_terhadap_hargasaham_plssem_smartpls
      
      dat_baru <- dat[c(terpilih_variabel_roe_terhadap_hargasaham_plssem_smartpls)]
      
      print(dat_baru)
      
      
    }
    
    
  })
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
} #akhir dari modul_literature_review_server

#akhir dari modul_literature_review_server
#akhir dari modul_literature_review_server
#akhir dari modul_literature_review_server

















































































ui <- fluidPage(
  
  
  #includeHTML("intro_home.html"),
  
  
  uiOutput("modul_literature_review"),
  
  
  br()
  
) #Akhir dari UI











server <- function(input, output) {
  
  
  
  
  
  output$modul_literature_review <- renderUI({
    
    
    
    #source("module//modul_literature_review.R")
    callModule(module = modul_literature_review_server, id = "modul_literature_review")
    modul_literature_review_ui(id = "modul_literature_review")
    
    
    
  })
  
  
  
  
  
  
  
  
  
  
  
} #Akhir dari server










shinyApp(ui, server)














