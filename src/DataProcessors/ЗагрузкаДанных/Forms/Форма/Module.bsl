#Область ОбработчикиКомандФормы
&НаКлиенте
Процедура ЗагрузитьФайл(Команда) 
	ОписаниеОЗавершении = Новый ОписаниеОповещения("ОбработатьФайл",Этотобъект); 
	ПараметрыДиалога = Новый ПараметрыДиалогаПомещенияФайлов;
	ПараметрыДиалога.Заголовок = "Выберите файл";
	ПараметрыДиалога.МножественныйВыбор = Ложь;
	ПараметрыДиалога.Фильтр = "Текстовый документ|*.csv";
	НачатьПомещениеФайлаНаСервер(ОписаниеОЗавершении,,,,ПараметрыДиалога);
КонецПроцедуры

&НаКлиенте
Процедура ВыполнитьОбработку(Команда)
	Массив = Новый Массив; 
	Массив.Добавить(Период);
	ВыполнитьОбработкуНаСервере(Массив);
КонецПроцедуры
#КонецОбласти

#Область СлужебныеПроцедурыИФункции
&НаКлиенте 
Процедура ОбработатьФайл(Результат,ДопДанные) Экспорт 
	Если НЕ Результат = Неопределено Тогда
		ОбработатьФайлНаСервере(Результат.Адрес);	
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ОбработатьФайлНаСервере(Адрес)   
	Массив = Новый Массив;
	Массив.Добавить(ПолучитьИзВременногоХранилища(Адрес));
	Задание = ОбщегоНазначенияСервер.ВыполнитьВФоновомРежиме("ОбщегоНазначенияСервер.ИнициироватьЗагрузкуФайла",Массив);
КонецПроцедуры

&НаСервереБезКонтекста
Процедура ВыполнитьОбработкуНаСервере(Массив)
	Задание = ОбщегоНазначенияСервер.ВыполнитьВФоновомРежиме("ОбщегоНазначенияСервер.ВыполнитьРасчетУслугОбработки",Массив);
КонецПроцедуры
#КонецОбласти
