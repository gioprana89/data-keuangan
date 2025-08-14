

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
    
    
    
    uiOutput(ns("radio_button_pilih_topik")),
    
    
    br(),
    
    uiOutput(ns("buka_pemilihan_informasi_hargasaham_endogen_plssem")),
    uiOutput(ns("buka_pemilihan_informasi_roa_terhadap_hargasaham")),
    
    
   # uiOutput(ns("buka_pemilihan_informasi_Kumpulan_Artikel_di_Jurnal_dengan_Metode_Analisis_Data_PLSSEM")),
    
    
    #uiOutput(ns("buka_pemilihan_informasi")),
    
  
    br(),
    
    
    #DT::DTOutput(ns("buka_data")),
    DT::DTOutput(ns("buka_data_hargasaham_endogen_plssem")),
   DT::DTOutput(ns("buka_data_roa_terhadap_hargasaham")),
               

    
    
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
                    
                    "Return on Asset (ROA) terhadap Harga Saham (30 Artikel)"
  
                    
                    
                 
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














