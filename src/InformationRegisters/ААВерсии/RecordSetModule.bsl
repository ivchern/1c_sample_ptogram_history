&НаСервере
Процедура ПередЗаписью(Отказ, Замещение)
	НаборЗаписей = РегистрыСведений.ААВерсии.СоздатьНаборЗаписей(); 
	НаборЗаписей.Отбор.Измерение1.Установить(Отбор.Измерение1.Значение); 
	НаборЗаписей.Прочитать();
	
	Если НаборЗаписей.Количество() > 0 Тогда 
		ПоследняяВерсияРегистра = Новый Структура(); 
		ПоследняяВерсияРегистра.Вставить("Реквизит2", НаборЗаписей[0].Реквизит2);
		
		ПараметрыСеанса.ВерсияПоследнегоОбъектаРегистра = Новый ФиксированнаяСтруктура(ПоследняяВерсияРегистра);			
	КонецЕсли;
	
	Если НаборЗаписей.Количество() < 1 Тогда
		Для Каждого Запись Из ЭтотОбъект Цикл
			ПоследняяВерсияРегистра = ПараметрыСеанса.ВерсияПоследнегоОбъектаРегистра; 
			
			ПараметрыДляУдаления = Новый Массив();
			ПараметрыДляУдаления.Добавить(Метаданные.ПараметрыСеанса.ВерсияПоследнегоОбъектаРегистра.Имя);
			ПараметрыСеанса.Очистить(ПараметрыДляУдаления);
			
			ПередаваемыеПараметры = Новый Структура; 
			ПередаваемыеПараметры.Вставить("Измерение1", Отбор.Измерение1.Значение);
					
			Если ПоследняяВерсияРегистра.Реквизит2 <> Запись.Реквизит2 Тогда
				ИсторияИзмененийРегистров.ЗаписатьИсториюРегистраСведений(Запись, Метаданные.РегистрыСведений.ААВерсии);	
			КонецЕсли;
		КонецЦикла;
	КонецЕсли;
КонецПроцедуры






                                                    