﻿#Область ОписаниеПеременных

Перем КонтекстЯдра;
Перем Ожидаем;

#КонецОбласти

#Область ИнтерфейсТестирования

Процедура Инициализация(КонтекстЯдраПараметр) Экспорт

	КонтекстЯдра	= КонтекстЯдраПараметр;
	Ожидаем			= КонтекстЯдра.Плагин("УтвержденияBDD");
	

КонецПроцедуры

Процедура ЗаполнитьНаборТестов(НаборТестов, КонтекстЯдраПараметр) Экспорт
	
	НаборТестов.Добавить("ТестДолжен_СложитьДваЧисла");
	НаборТестов.Добавить("ТестДолжен_СложитьДваЧислаСОшибкой");
	
КонецПроцедуры

#КонецОбласти

#Область Тесты

Процедура ТестДолжен_СложитьДваЧисла() Экспорт

	ПервоеСлогаемое = 2;
	ВтороеСлогаемое = 2;
	
	Результат = ПервоеСлогаемое + ВтороеСлогаемое;
	
	Ожидаем.Что(Результат, "Результат сложения должен ровняться 4")
		.ИмеетТип("Число")
		.Равно(4);
		
КонецПроцедуры

Процедура ТестДолжен_СложитьДваЧислаСОшибкой() Экспорт

	ПервоеСлогаемое = 20;
	ВтороеСлогаемое = 2;
	
	Результат = ПервоеСлогаемое + ВтороеСлогаемое;

	// Тут получим исключение
	Ожидаем.Что(Результат, "Результат сложения должен ровняться 22")
		.ИмеетТип("Число")
		.Равно(21);
		
КонецПроцедуры

#КонецОбласти
