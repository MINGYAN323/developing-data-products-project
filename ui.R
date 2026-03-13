library(shiny)

shinyUI(fluidPage(
  
  titlePanel("mtcars 回归分析工具"),
  
  sidebarLayout(
    sidebarPanel(
      h4("如何使用"),
      p("选择下方的预测变量，右侧将显示线性回归模型的结果和拟合图。"),
      p("数据来源：R 内置 mtcars 数据集（1974 年 Motor Trend 杂志的 32 辆汽车数据）。"),
      br(),
      
      selectInput("predictor", 
                  label = "选择预测变量 (x 轴):",
                  choices = list("车重 (wt)" = "wt", 
                                 "马力 (hp)" = "hp", 
                                 "排量 (disp)" = "disp"),
                  selected = "wt"),
      
      p("响应变量固定为 mpg（每加仑英里数）。")
    ),
    
    mainPanel(
      h4("模型摘要"),
      verbatimTextOutput("summary"),
      
      h4("回归拟合图"),
      plotOutput("plot")
    )
  )
))