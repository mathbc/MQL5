//+------------------------------------------------------------------+
//|                                                1-detecta_gap.mq5 |
//|                                   Copyright 2019, Matheus Victor |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019, Matheus Victor"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---

   // Busca os candles
   MqlRates rates[];
   ArraySetAsSeries(rates, true);
   
   int totalCopiado = CopyRates(_Symbol, 0, 0, 30  , rates);
   
   if(totalCopiado > 0)
   {
      Print("Candles copiados: ", totalCopiado);
      
      // a condição busca o 9 para não cair processamento fora do vetor.
      for(int i = 1; i < totalCopiado-1; i++)
      {
         MqlRates candleAtual = rates[i];
         MqlRates candleAnterior = rates[i+1];
         
         if(candleAtual.open > candleAnterior.close )
         {  
            Print("Na data ", candleAnterior.time, " Ocorreu um GAP de ALTA");
         }else if(candleAtual.open < candleAnterior.close){
            Print("Na data ", candleAnterior.time, " Ocorreu um GAP de BAIXA");
         }else{
            Print("Não ocorreu GAP nos periodos ", i+1, " - ", i);
         }
      }
   }else {
      Print("Falha ao receber dados do ativo...: ", _Symbol);
   }
  }
//+------------------------------------------------------------------+
