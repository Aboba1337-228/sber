-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 05 2022 г., 05:08
-- Версия сервера: 5.5.62
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sber`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `materials`
--

CREATE TABLE `materials` (
  `id` int(11) NOT NULL,
  `name_materials` varchar(255) NOT NULL,
  `materials` text NOT NULL,
  `test_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `materials`
--

INSERT INTO `materials` (`id`, `name_materials`, `materials`, `test_id`) VALUES
(1, 'Полномочия участников избирательного процесса в помещении УИК', '\r\n', 1),
(8, 'Материал №2', '\r\n', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `mynicipal`
--

CREATE TABLE `mynicipal` (
  `id` int(11) NOT NULL,
  `mynicipal` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `mynicipal`
--

INSERT INTO `mynicipal` (`id`, `mynicipal`) VALUES
(1, 'Оренбург'),
(2, 'Сакмарский район'),
(3, 'Саракташский район'),
(4, 'Самара'),
(5, 'г. Орск');

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `name_news` text NOT NULL,
  `date_news` varchar(255) NOT NULL,
  `discript_news` text NOT NULL,
  `news_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `name_news`, `date_news`, `discript_news`, `news_image`) VALUES
(1, 'Оренбургские школьники приняли активное участие в первом туре олимпиады \"Софиум\"\n\n', '16.11.2022', 'В Оренбуржье состоялся первый (отборочный) тур регионального этапа Всероссийской олимпиады по вопросам избирательного права и избирательного процесса «Софиум».\n\n  В нём приняли участие 250 школьников со всей области.\n\n Первый тур проходил на базе общеобразовательных организаций региона.\n\n  Старшеклассники решали пять ситуационных задач, утвержденных ЦИК России, и писали эссе по актуальным вопросам избирательного права и избирательного процесса.\n\n Так, например, в Саракташской школе №2 задания выполняли 10 человек. В школе №35 областного центра - 15. В Медногорске изъявили желание попробовать свои силы в интеллектуальном состязании 13 школьников. Всех участников олимпиады объединяет интерес к выборам и избирательному праву.\n\n - Я участвую не первый раз, мне нравится решать задачи олимпиады \"Софиум\" просто даже для получения новых знаний и расширения кругозора, - признался учащийся школы №7 Медногорска  Кирилл Жигулин, - я готовился и самостоятельно, и благодаря урокам по истории и обществознанию. В этом году задания были не очень сложные, но нужно было логически подумать и знать законодательство.\n\n Уже скоро конкурсная комиссия приступит к проверке работ.\n\n Три участника, набравшие наибольшее количество баллов, пройдут во второй тур регионального этапа, а лучшие из лучших смогут поучаствовать в финале, который пройдет в Москве!\n\n Избирательная комиссия Оренбургской области благодарит за содействие в проведении регионального этапа олимпиады руководство образовательных организаций области, педагогов и родителей ребят!\n\n Напомним, олимпиада \"Софиум\" проводится ежегодно. Победители федерального этапа, помимо поощрительных наград, получают дополнительные баллы для поступления в Московский государственный юридический университет имени О.Е Кутафина (МГЮА).\n\n', 'data:image/jpeg;base64,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'),
(2, 'Организаторы выборов Оренбуржья обсудят итоги избирательных кампаний и подготовку к новым выборам\n\n', '8.11.2022', '10 и 11 ноября Избирательная комиссия Оренбургской области проведёт форум-семинар с председателями территориальных избирательных комиссий, участвовавших в проведении муниципальных выборов в сентябре 2022 года.\n\n К ним также присоединятся председатели комиссий, которые будут задействованы в организации выборов в следующем году.\n\n Всего в семинаре примут участие представители 25 территориальных избирательных комиссий региона.\n\n Семинар будет включать в себя несколько лекционных блоков и практикумы.\n\n Напомним, в сентябре в Оренбуржье прошли муниципальные выборы по 21 избирательной кампании. В результате избраны 56 депутатов   городских, районных и сельских советов и два главы сельсоветов.\n\n В ходе практических занятий председатели ТИК обменяются опытом и обсудят вопросы, касающиеся:\n\n- применения новелл избирательного права;\n\n- использования интерактивного рабочего блокнота (ИРБ);\n\n- взаимодействия с участниками избирательного процесса на избирательном участке и других тем.\n\n - Формат нашей встречи - это своего рода работа над ошибками. Мы детально проанализируем все особенности и нюансы, с которыми комиссиям пришлось столкнуться в работе, и в особенности применение новшеств избирательного законодательства на уровне муниципальных выборов, - подчеркнула председатель облизбиркома Евгения Ивлева, - кроме этого, обязательно затронем с коллегами тему формирования УИК, так как в следующем году у нас в регионе истекают полномочия 99 процентов участковых избирательных комиссий. Особое внимание, конечно, уделим задачам следующего избирательного цикла!\n\n Председатель Избирательной комиссии Оренбургской области отметила, что, по предварительным данным, 29 избирательных кампаний планируются в Оренбургской области на 2023 год. В их числе 26 кампаний по основным выборам депутатов сельских поселений. Не менее значимыми и крупными будут и дополнительные выборы депутатов Оренбургского и Новотроицкого городских Советов. Жителям муниципального образования Южноуральский сельсовет Оренбургского района предстоит избрать главу.', 'data:image/png;base64,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'),
(3, 'Региональный этап олимпиады \"Софиум\" пройдет 15 ноября!', '3.11.2022', 'Приглашаем школьников Оренбуржья принять участие во Всероссийской олимпиаде по вопросам избирательного права и избирательного процесса!\r\n\r\nТрадиционно участниками «Софиума» могут стать учащиеся 10-х и 11-х классов общеобразовательных организаций.\r\n\r\nРегиональный этап пройдёт в дистанционном формате в 2 тура.\r\n\r\nПервый тур - участники получат задания. Необходимо будет решить 5 ситуационных задач и написать эссе.\r\n\r\nВторой тур - электронное тестирование на базе официального сайта РЦОИТ при ЦИК России.\r\n\r\nПобедители регионального этапа отправятся на финал олимпиады в Москву.\r\n\r\n В прошлом учебном году более 350 ребят из Оренбуржья приняли участие в региональном туре олимпиады \"Софиум\". По его итогам сразу трое школьников представили наш регион на заключительном этапе, который прошёл в ЦИК России!\r\n\r\n Напомним, победителям и призерам заключительного этапа при поступлении в Университет имени О.Е. Кутафина (МГЮА) начисляются дополнительные баллы.\r\n\r\n Заявки на участие в региональном этапе принимаются Избирательной комиссией Оренбургской области по адресу электронной почты: sofium@ik56.ru с пометкой «Софиум».\r\n\r\nС документами можно ознакомиться по ссылке\r\n\r\n Подготовиться к испытаниям регионального этапа поможет телеграм-канал «Электорий».\r\n\r\nПод хештегом #подготовьсяксофиуму размещаются примерные задачи и их решения.\r\n\r\nУспейте подготовиться и принять участие в олимпиаде!\r\n\r\n', 'data:image/jpeg;base64,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');

-- --------------------------------------------------------

--
-- Структура таблицы `test_otvet`
--

CREATE TABLE `test_otvet` (
  `id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `verify_answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `test_otvet`
--

INSERT INTO `test_otvet` (`id`, `test_id`, `answer`, `verify_answer`) VALUES
(1, 1, '[[\"в одну участковую избирательную комиссию;\",\"во все участковые избирательные комиссии одного избирательного округа.\",\"в две участковых избирательных комиссий;\"],[\"фамилия, имя и отчество каждого наблюдателя, адрес его места жительства;\",\" фамилия, имя и отчество каждого наблюдателя, номер избирательного участка, наименование комиссии, куда наблюдатель направляется;\",\"фамилия, имя и отчество каждого наблюдателя, адрес его места жительства, номер избирательного участка, наименование комиссии, куда наблюдатель направляется, запись об отсутствии установленных действующим избирательным законодательством ограничений к назначению наблюдателем;\",\"фамилия, имя и отчество каждого наблюдателя, адрес его места жительства, сведения об образовании, номер избирательного участка, наименование комиссии, куда наблюдатель направляется.\"],[\"письменного направления и паспорта/заменяющий его документ;\",\"достаточно паспорта/заменяющего его документа;\",\"достаточно одного направления.\"],[\"накомиться со списком избирателей, реестром заявлений (обращений) о голосовании вне помещения для голосования\",\"выдавать избирателю избирательный бюллетень\",\"расписываться за избирателя, в том числе по его просьбе, в получении избирательного бюллетеня\",\"предпринимать действия, нарушающие тайну голосования\"],[\"обжаловать решения и действия (бездействие) участковой избирательной комиссии, в которую он направлен, в непосредственно вышестоящую территориальную избирательную комиссию или в суд;\",\"принимать непосредственное участие в проводимом членами участковой избирательной комиссии с правом решающего голоса подсчете избирательных бюллетеней;\",\"визуально знакомиться с любым заполненным или незаполненным избирательным бюллетенем при подсчете голосов избирателей;\",\"наблюдать за составлением УИК протокола об итогах голосования и иных документов;\"],[\"все трое имеют право находиться на участке одновременно;\",\"на каждый день голосования назначается конкретный наблюдатель;\",\"на избирательном участке наблюдатели могут находиться только поочередно\"],[\"наблюдатели\",\"кандидаты\",\"представители администрации (района, города)\",\"СМИ\",\"депутаты\"],[\"да\", \"Нет\"],[\"да\", \"Нет\", \"да, если он общается с избирателями.\"],[\"присутствовать на избирательном участке\",\"наблюдать за ходом голосования\",\" знакомиться с избирательной документацией\"],[\"представить в ТИК документы по выдвижению кандидата (ов);\",\"представить в ТИК документы о направлении наблюдателей;\",\"представить в ТИК жалобы (заявления) на действие (бездействие) членов УИК;\",\"присутствовать на заседании УИК.\"],[\"аккредитованные представители СМИ\", \"любые представители СМИ\"],[\"участвовать в выездном голосовании;\",\"контролировать ход голосования на избирательных участках;\",\"находится на избирательном участке и общаться с избирателями;\",\"контролировать деятельность участников выборов по устранению нарушений избирательного законодательства.\"]]', '[\"в одну участковую избирательную комиссию;\",\"фамилия, имя и отчество каждого наблюдателя, адрес его места жительства, номер избирательного участка, наименование комиссии, куда наблюдатель направляется, запись об отсутствии установленных действующим избирательным законодательством ограничений к назначению наблюдателем;\", \"фамилия, имя и отчество каждого наблюдателя, адрес его места жительства, номер избирательного участка, наименование комиссии, куда наблюдатель направляется, запись об отсутствии установленных действующим избирательным законодательством ограничений к назначению наблюдателем;\",\"письменного направления и паспорта/заменяющий его документ;\",\"знакомиться со списком избирателей, реестром заявлений (обращений) о голосовании вне помещения для голосования;\", \"принимать непосредственное участие в проводимом членами участковой избирательной комиссии с правом решающего голоса подсчете избирательных бюллетеней;\", \" на избирательном участке наблюдатели могут находиться только поочередно.\", \" СМИ;\",\"нет.\",\"да, если он общается с избирателями.\",\"присутствовать на избирательном участке\", \"представить в ТИК документы по выдвижению кандидата (ов);\", \"аккредитованные представители СМИ;\"]\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `test_quest`
--

CREATE TABLE `test_quest` (
  `id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `quest` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `test_quest`
--

INSERT INTO `test_quest` (`id`, `test_id`, `quest`) VALUES
(1, 1, '[\"Один и тот же гражданин может быть назначен наблюдателем:\",\"При направлении наблюдателей на УИК указываются следующие данные:\",\"УИК допускает наблюдателя к работе только при условии наличия у него:\",\"Наблюдатель вправе:\",\"Наблюдатель не вправе:\",\"Согласно избирательному законодательству на избирательный участок могут быть направлены три наблюдателя. Это значит, что:\",\"Удаление каких лиц из помещения для голосования в случае нарушения законодательства о выборах осуществляется по решению суда:\",\"Вправе ли кандидат присутствовать при организации выездного голосования на дому:\",\"Присутствие кандидата в помещении для голосования может расцениваться как агитационные действия:\",\"Кандидат имеет право: \",\"Уполномоченный представитель избирательного объединения имеет право:\",\"При подсчете голосов избирателей, на заседании УИК при подведении итогов голосования вправе присутствовать:\",\"Депутат (районного, городского совета) вправе:\"]');

-- --------------------------------------------------------

--
-- Структура таблицы `test_result`
--

CREATE TABLE `test_result` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `test_result`
--

INSERT INTO `test_result` (`id`, `name`, `result`) VALUES
(1, 'OOO', '[1,0,1,1,1,1,1,1,1,1,1,1,1]'),
(2, 'Сергеев Сергей Сергеевич', '[0,0,0,0,0,0,0,0,0,0,0,0,0]'),
(3, 'Абрамов Андрей Валентинович', '[0,0,0,0,0,0,0,0,0,0,0,0,0]'),
(4, 'Абрамов Андрей Валентинович', '[0,0,0,0,0,0,0,0,0,0,0,0,0]'),
(5, 'Сергеев Сергей Сергеевич', '[0,0,0,0,0,0,0,0,0,0,0,0,0]'),
(6, 'Сергеев Сергей Сергеевич', '[0,0,0,0,0,0,0,0,0,0,0,0,0]'),
(7, 'Сергеев Сергей Сергеевич', '[0,0,0,0,0,0,0,0,0,0,0,0,0]'),
(8, 'Сергеев Сергей Сергеевич', '[0,0,0,0,0,0,0,0,0,0,0,0,0]'),
(9, 'Сергеев Сергей Сергеевич', '[0,0,0,0,0,0,0,0,0,0,0,0,0]'),
(10, 'Сергеев Сергей Сергеевич', '[0,0,0,0,0,0,0,0,0,0,0,0,0]'),
(11, 'Сергеев Сергей Сергеевич', '[1,0,0,0,0,0,0,0,0,0,0,0,0]'),
(12, 'Сергеев Сергей Сергеевич', '[1,0,0,0,0,0,0,0,0,0,0,0,0]'),
(13, 'Сергеев Сергей Сергеевич', '[1,0,0,0,0,0,0,0,0,0,0,0,0]'),
(14, 'Сергеев Сергей Сергеевич', '[0,0,0,0,0,0,0,0,0,0,0,0,0]'),
(15, 'Сергеев Сергей Сергеевич', '[1,1,0,0,0,0,0,0,0,0,0,0,0]'),
(16, 'Сергеев Сергей Сергеевич', '[]'),
(17, 'Сергеев Сергей Сергеевич', '[0,0,0,0,0,0,0,0,0,0,0,0,0]');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(100) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `number`, `mail`, `password`, `city`) VALUES
(28, 'Сергеев Сергей Сергеевич', '+79999999', '1234@mail.ru', '123123', 'Самара'),
(34, 'ivan ivanov ivano', '+7999999', '123456@mail.ru', '123123', 'Оренбург'),
(35, 'Арма Бикимов', '+79228491353', 'bikimov_arman@mail.ru', '123123', 'Оренбург'),
(36, 'Ор', '89222596815', 'Nady_er@mail.ru', '1234&', 'Оренбург'),
(37, 'Абрамов Андрей Валентинович', '89033980035', 'Andya1@mail.ru', '!QAZ2wsx', 'Оренбург');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mynicipal`
--
ALTER TABLE `mynicipal`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `test_otvet`
--
ALTER TABLE `test_otvet`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `test_quest`
--
ALTER TABLE `test_quest`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `test_result`
--
ALTER TABLE `test_result`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `mynicipal`
--
ALTER TABLE `mynicipal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `test_otvet`
--
ALTER TABLE `test_otvet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `test_quest`
--
ALTER TABLE `test_quest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `test_result`
--
ALTER TABLE `test_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
