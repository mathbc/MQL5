//+------------------------------------------------------------------+
//|                                     regressao_linear_simples.mq5 |
//|                                   Copyright 2020, Matheus Victor |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, Matheus Victor"
#property link      ""
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   //--------------------------
   // Formula: y = mx + b 
   //--------------------------
   // m = coeficiente angular
   // b = coefieciente linear
   
   //---------------------------------
   // Uma empresa resolveu estudar a variação de demanda (em unidades) de seu produto
   // em função do preço de venda (em reais) praticado.
   
   // Dados
   double eixox[10] = {36, 43, 49, 55, 61, 63, 69, 72, 74, 77};                  // Baseado na abertura dos candles
   double eixoy[10] = {350, 330, 296, 252, 230, 218, 203, 196, 188, 167};        // Baseado nos fechamentos do candle
   double xy_array[10];                                                          // Array com a multiplicação dos valores de x e y
   
   double somatoriax = 0;
   double somatoriay = 0;
   double somatoria_xy = 0;
   
   // Arrays com valores dos eixos ao quadrado
   double eixox_quadrado_array[10];    
   double eixoy_quadrado_array[10];
   
   // Totais dos eixos ao quadrado
   double somatoria_eixox_quadrado = 0;
   double somatoria_eixoy_quadrado = 0;
       
   double valor_previsao = 0;
       
   int tamanhoArray = ArraySize(eixox);
   
   for(int i = 0; i < tamanhoArray; i++)
   {
      // Calcula a somatória dos eixos x e y   
       somatoriax += eixox[i];
       somatoriay += eixoy[i];
       
       // Incrementa o array de XY e calcula sua somatória
       xy_array[i] = eixox[i] * eixoy[i]; 
       somatoria_xy += xy_array[i]; 
              
       // Icrementa o arrays dos eixos ao quadrado
       eixox_quadrado_array[i] = eixox[i] * eixox[i];
       eixoy_quadrado_array[i] = eixoy[i] * eixoy[i];
       
       // Calula a somatória dos eixos ao quadrado
       somatoria_eixox_quadrado += eixox_quadrado_array[i];
       somatoria_eixoy_quadrado += eixoy_quadrado_array[i]; 
   }
   
   // Calculando o m:
   double m_cima = (tamanhoArray * somatoria_xy) - (somatoriax * somatoriay);
   double m_baixo = (tamanhoArray * somatoria_eixox_quadrado) - (somatoriax * somatoriax);
   double m = m_cima / m_baixo;
   
   // Calculando o b:
   double b_cima = (somatoria_eixox_quadrado * somatoriay) - (somatoriax * somatoria_xy);
   double b_baixo = (tamanhoArray * somatoria_eixox_quadrado) - (somatoriax * somatoriax);
   double b = b_cima / b_baixo;
   
   // Calculando o y
   double y = (m * 80) + b;
   Print(y); 
  }
//+------------------------------------------------------------------+
