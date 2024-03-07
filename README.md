# Detection of fake hotels reviews

## Задача
Множество агрегаторов отелей и туристических мест (Booking, TripAdvisor, Expedia) сталкивается с [проблемой фейковых отзывов на отели](https://www.phocuswire.com/Booking-Expedia-Tripadvisor-form-coalition-to-fight-fake-reviews).
Фейковые отзывы могут быть как положительными (отель накручивает свой рейтинг), так и отрицательными (их могут писать новым отелям их конкуренты).
Модель, способная различать настоящие отзывы от поддельных, поможет фильтровать имеющиеся у агрегатора отзывы на отели и формировать более честный рейтинг.

## Данные
Используется датасет [Deceptive Opinion Spam Corpus v1.4](https://myleott.com/op-spam.html).
Этот корпус содержит:
 - настоящие положительные отзывы с TripAdvisor 
 - фейковые положительные отзывы с Mechanical Turk 
 - настоящие отрицательные отзывы от Expedia, Hotels.com, Orbitz, Priceline, TripAdvisor и Yelp 
 - фейковые отрицательные отзывы от Mechanical Turk.

## Модель решения
1) Получение эмбеддингов отзывов с помощью [LaBSE](https://huggingface.co/sentence-transformers/LaBSE).
2) Эмбеддинги подаются на вход 4х-слойному перцептрону, который будем обучать. Его последний слой  - линейный с 4 выходами - логитами вероятности классов.
4) Лосс - стандартная кросс-энтропия.

## Применение в продакшене
1) получение новых отзывов, оставленных в форме для отзыва на сайте
2) запуск скрипта инференса модели
3) сохранение результатов на сервере
4) публикация отзывов, классифицированных как настоящие.
