<!-- 
 *   https://github.com/andreysssr/examples
-->

# Docker

Общие команды:  
[docker run - Создать и запустить новый контейнер из образа](#run)  
[docker exec - Выполнить команду в работающем контейнере](#exec)  
[docker ps - Список контейнеров](#ps)  
[docker build - Начать сборку образа](#build)  
[docker pull - Скачать образ из реестра](#pull)  
[docker push - Загрузить образ в реестр](#push)  
[docker images - Список образов](#images)  
[docker login - Войдите в реестр](#login)  
[docker logout - Выйти из реестра](#logout)  
[docker search - Поиск образов в Docker Hub](#search)  
[docker version - Показать информацию о версии Docker](#version)  
[docker info - Отображение общесистемной информации](#info)  

Команды управления:  
[docker container - Управление контейнерами](#container)  
[docker context - Управление контекстом](#context)  
[docker image - Управление образами](#image)  
[docker network - Управление сетями](#network)  
[docker system - Управление докером](#system)  
[docker volume - Управление томами](#volume)  

Команды:  
[docker attach - Прикрепите локальные стандартные потоки ввода, вывода и ошибок к работающему контейнеру.](#attach)  
[docker commit - Создать новый образ из изменений контейнера](#commit)  
[docker cp - Скопируйте папки с файлами между контейнером и локальной файловой системой.](#cp)  
[docker create - Создать новый контейнер](#create)  
[docker diff - Проверяйте изменения в файлах или каталогах в файловой системе контейнера.](#diff)  
[docker events - Получайте события в реальном времени с сервера](#events)  
[docker export - Экспорт файловой системы контейнера в виде tar-архива](#export)  
[docker import - Импортируйте содержимое из архива для создания образа файловой системы.](#import)  
[docker history - Показать историю образа](#history)  
[docker inspect - Возврат низкоуровневой информации об объектах Docker.](#inspect)  
[docker kill - Убейте один или несколько запущенных контейнеров](#kill)  
[docker load - Загрузите образ из архива tar или STDIN](#load)  
[docker logs - Получить журналы контейнера](#logs)  
[docker pause - Приостановить все процессы в одном или нескольких контейнерах](#pause)  
[docker unpause - Разблокировать все процессы в одном или нескольких контейнерах](#unpause)  
[docker port - Список сопоставлений портов или конкретное сопоставление для контейнера](#port)  
[docker rename - Переименовать контейнер](#rename)  
[docker restart - Перезапустите один или несколько контейнеров](#restart)  
[docker rm - Удалить один или несколько контейнеров](#rm)  
[docker rmi - Удалить один или несколько образов](#rmi)  
[docker save - Сохраните одно или несколько образов в tar-архив (по умолчанию передается в STDOUT)](#save)  
[docker start - Запустить один или несколько остановленных контейнеров](#start)  
[docker stats - Отображение статистики использования ресурсов контейнеров в реальном времени.](#stats)  
[docker stop - Остановить один или несколько запущенных контейнеров](#stop)  
[docker tag - Создайте тег TARGET_IMAGE, который ссылается на SOURCE_IMAGE.](#tag)  
[docker top - Отображение запущенных процессов контейнера](#top)  
[docker update - Обновить конфигурацию одного или нескольких контейнеров](#update)  
[docker wait - Блокируйте до тех пор, пока один или несколько контейнеров не остановятся, а затем распечатайте их коды выхода.](#wait)  

--- 

```
Используется:  docker [OPTIONS] COMMAND

Автономная среда выполнения для контейнеров

Общие команды:
run         Создать и запустить новый контейнер из образа
exec        Выполнить команду в работающем контейнере
ps          Список контейнеров
build       Создайте образ из Dockerfile
pull        Скачать образ из реестра
push        Загрузить образ в реестр
images      Список образов
login       Войдите в реестр
logout      Выйти из реестра
search      Поиск образов в Docker Hub
version     Показать информацию о версии Docker
info        Отображение общесистемной информации

Команды управления:
builder     Начать сборку
buildx*     Docker Buildx (Docker Inc., v0.10.2)
checkpoint  Управление контрольными точками
compose*    Докер создавать (Docker Inc., v2.13.0)
container   Управление контейнерами
context     Управление контекстом
dev*        Среды разработки Docker (Docker Inc., v0.0.5)
extension*  Управляет расширениями Docker (Docker Inc., v0.2.16)
image       Управление образами
manifest    Управление манифестами образов Docker и списками манифестов
network     Управление сетями
plugin      Управление плагинами
sbom*       Просмотрите пакетную спецификацию программного обеспечения (SBOM) для образа (Anchore Inc., 0.6.0)
scan*       Докер сканирование(Docker Inc., v0.22.0)
system      Управление докером
trust       Управление доверием к образам Docker
volume      Управление томами

Команды:
attach      Прикрепите локальные стандартные потоки ввода, вывода и ошибок к работающему контейнеру.
commit      Создать новый образ из изменений контейнера
cp          Скопируйте папки с файлами между контейнером и локальной файловой системой.
create      Создать новый контейнер
diff        Проверяйте изменения в файлах или каталогах в файловой системе контейнера.
events      Получайте события в реальном времени с сервера
export      Экспорт файловой системы контейнера в виде tar-архива
history     Показать историю образа
import      Импортируйте содержимое из архива для создания образа файловой системы.
inspect     Возврат низкоуровневой информации об объектах Docker
kill        Убейте один или несколько запущенных контейнеров
load        Загрузите образ из архива tar или STDIN
logs        Получить журналы контейнера
pause       Приостановить все процессы в одном или нескольких контейнерах
port        Список сопоставлений портов или конкретное сопоставление для контейнера
rename      Переименовать контейнер
restart     Перезапустите один или несколько контейнеров
rm          Удалить один или несколько контейнеров
rmi         Удалить одно или несколько образов
save        Сохраните одно или несколько образова в tar-архив (по умолчанию передается в STDOUT)
start       Запустить один или несколько остановленных контейнеров
stats       Отображение статистики использования ресурсов контейнеров в реальном времени.
stop        Остановить один или несколько запущенных контейнеров
tag         Создайте тег TARGET_IMAGE, который ссылается на SOURCE_IMAGE.
top         Отображение запущенных процессов контейнера
unpause     Разблокировать все процессы в одном или нескольких контейнерах
update      Обновить конфигурацию одного или нескольких контейнеров
wait        Блокируйте до тех пор, пока один или несколько контейнеров не остановятся, а затем распечатайте их коды выхода.

Глобальные параметры:
--config string          Расположение файлов конфигурации клиента (default "/home/user/.docker")
-c, --context string     Имя контекста, используемого для подключения к демону (переопределяет DOCKER_HOST env var и контекст по умолчанию, установленный на «использование контекста докера»)
-D, --debug              Включить режим отладки
-H, --host list          Сокет(ы) демона для подключения
-l, --log-level string   Установите уровень ведения журнала ("debug", "info", "warn", "error", "fatal") (default "info")
--tls                    Использовать TLS; implied by --tlsverify
--tlscacert string       Сертификаты доверия, подписанные только этим CA (default "/home/user/.docker/ca.pem")
--tlscert string         Путь к файлу сертификата TLS (default "/home/user/.docker/cert.pem")
--tlskey string          Путь к файлу сертификата TLS(default "/home/user/.docker/key.pem")
--tlsverify              Используйте TLS и проверьте удаленный
-v, --version            Распечатать информацию о версии и выйти

```

---
<a name="run"><h2>Создать и запустить новый контейнер из образа</h2></a>
### docker run - Создать и запустить новый контейнер из образа

Используется:  
- `docker run [OPTIONS] IMAGE [COMMAND] [ARG...]`

Псевдонимы:
- `docker container run`,
- `docker run`

```bash
docker run nginx # запустить конейнер из образа (nginx)
docker run -d nginx # (-d) запустить конейнер в фоновом режиме
docker run -d -p 8080:80 nginx  # (-p 8080:80) прокинуть порты  (8080 порт хоста) на (80 порт docker)
docker run -d -p 8080:80 --name app_nginx nginx # (--name app_nginx) присвоить имя для создаваемого контейнера
docker run -d -p 8080:80 --name app_nginx -v ./:/usr/share/nginx/html nginx # (-v ./:/usr/share/nginx/html) примонтировать текущую папку в контейнер
docker run --rm -d -p 8080:80 --name app_nginx -v ./:/usr/share/nginx/html nginx # (--rm) удаление контейнера после его остановки
docker run --rm -it nginx sh # запустить контейнер, подключиться, и запустить оболочку (sh)
docker run -d -u 1000:1000 nginx # (-u) подключиться под пользователем с (id=1000) и (group=1000)
docker run --cpus=.5 nginx     # ограничение ресурсов процессора
docker run --memory=100m nginx # ограничение ресурсов памяти
```

```
[OPTIONS]
--add-host               Добавьте пользовательское сопоставление хоста с IP (хост: ip)
--attach,-a              Прикрепить к STDIN, STDOUT или STDERR
--blkio-weight           Блокировать ввод-вывод (относительный вес), от 10 до 1000 или 0 для отключения (по умолчанию 0)
--blkio-weight-device    Вес блока ввода-вывода (относительный вес устройства)
--cap-add                Добавьте возможности Linux
--cap-drop               Отбросьте возможности Linux
--cgroup-parent          Необязательная родительская контрольная группа для контейнера
--cgroupns               API 1.41+ Используемое пространство имен cgroup (host|private) 'host': Запустите контейнер в пространстве имен cgroup хоста Docker 'private': Запустите контейнер в собственном частном пространстве имен cgroup '': Используйте пространство имен cgroup, как настроено default-cgroupns- опция режима на демоне (по умолчанию)
--cidfile                Запишите идентификатор контейнера в файл
--cpu-count              Количество ЦП (только для Windows)
--cpu-percent            Процент ЦП (только для Windows)
--cpu-period             Ограничить период CPU CFS (Completely Fair Scheduler)
--cpu-quota              Ограничить квоту CPU CFS (Completely Fair Scheduler)
--cpu-rt-period          Ограничить период реального времени процессора в микросекундах
--cpu-rt-runtime         Ограничение времени работы процессора в режиме реального времени в микросекундах
--cpu-shares,-c          Доли ЦП (относительный вес)
--cpus                   Количество процессоров
--cpuset-cpus            ЦП, в которых разрешено выполнение (0-3, 0,1)
--cpuset-mems            MEM, в которых разрешено выполнение (0-3, 0,1)
--device                 Добавьте хост-устройство в контейнер
--device-cgroup-rule     Добавить правило в список разрешенных устройств cgroup
--device-read-bps        Ограничить скорость чтения (байт в секунду) с устройства
--device-read-iops       Ограничить скорость чтения (IO в секунду) с устройства
--device-write-bps       Ограничить скорость записи (байт в секунду) на устройство
--device-write-iops      Ограничить скорость записи (IO в секунду) на устройство
--disable-content-trust true	Пропустить проверку образа
--dns                    Установить пользовательские DNS-серверы
--dns-option             Установить параметры DNS
--dns-search             Установить пользовательские домены поиска DNS
--domainname             Доменное имя контейнера NIS
--entrypoint             Перезаписать ENTRYPOINT образа по умолчанию.
--env,-e                 Установить переменные среды
--env-file               Чтение в файле переменных окружения
--expose                 Откройте порт или диапазон портов
--gpus                   API 1.40+ Устройства GPU для добавления в контейнер («все», чтобы передать все GPU)
--group-add              Добавьте дополнительные группы для присоединения
--health-cmd             Команда для проверки работоспособности
--health-interval        Время между запуском проверки (мс|с|м|ч) (по умолчанию 0 с)
--health-retries         Последовательные сбои, необходимые для сообщения о нездоровом
--health-start-period    Начальный период для инициализации контейнера перед запуском обратного отсчета повторных попыток работоспособности (мс | с | м | ч) (по умолчанию 0 с)
--health-timeout         Максимальное время выполнения одной проверки (мс|с|м|ч) (по умолчанию 0 с)
--help                   Использование печати
--hostname,-h            Имя узла контейнера
--init                   Запустите init внутри контейнера, который перенаправляет сигналы и собирает процессы.
--interactive,-i         Держите STDIN открытым, даже если он не подключен
--io-maxbandwidth        Максимальный предел пропускной способности ввода-вывода для системного диска (только для Windows)
--io-maxiops             Максимальное ограничение IOps для системного диска (только для Windows)
--ip                     IPv4-адрес (например, 172.30.100.104)
--ip6                    IPv6-адрес (например, 2001:db8::33)
--ipc                    Режим IPC для использования
--isolation              Технология изоляции контейнеров
--kernel-memory          Ограничение памяти ядра
--label,-l               Установить метаданные в контейнере
--label-file             Чтение файла этикеток с разделителями строк
--link                   Добавить ссылку на другой контейнер
--link-local-ip          Контейнер IPv4/IPv6 link-local адреса
--log-driver             Драйвер логирования для контейнера
--log-opt                Параметры драйвера журнала
--mac-address            MAC-адрес контейнера (например, 92:d0:c6:0a:29:33)
--memory,-m              Лимит памяти
--memory-reservation     Мягкий лимит памяти
--memory-swap            Предел подкачки равен объему памяти плюс подкачка: '-1' для включения неограниченного подкачки
--memory-swappiness -1	 Настройка подкачки памяти контейнера (от 0 до 100)
--mount                  Прикрепите монтирование файловой системы к контейнеру
--name                   Присвоить имя контейнеру
--network                Подключить контейнер к сети
--network-alias          Добавить псевдоним для контейнера с областью действия сети
--no-healthcheck         Отключите все HEALTHCHECK, указанные в контейнере.
--oom-kill-disable       Отключить убийцу OOM
--oom-score-adj          Настройте параметры OOM хоста (от -1000 до 1000)
--pid                    пространство имен PID для использования
--pids-limit             Настройте лимит PID контейнеров (установите -1 для неограниченного)
--platform               Установите платформу, если сервер поддерживает многоплатформенность
--privileged             Предоставьте расширенные права этому контейнеру
--publish,-p             Публикация портов контейнера на хосте
--publish-all,-P         Публиковать все открытые порты на случайные порты
--pull	missing	         Скачать образ перед созданием ( always, |missing, never)
--quiet,-q               Подавить вывод pull
--read-only              Смонтируйте корневую файловую систему контейнера только для чтения
--restart no	         Политика перезапуска для применения при выходе из контейнера
--rm                     Автоматически удалять контейнер при его выходе
--runtime                Время выполнения для этого контейнера
--security-opt           Параметры безопасности
--shm-size               Размер /dev/shm
--stop-signal            Сигнал для остановки контейнера
--stop-timeout           Время ожидания (в секундах) для остановки контейнера
--storage-opt            Параметры драйвера хранилища для контейнера
--sysctl                 параметры Sysctl
--tmpfs                  Смонтировать каталог tmpfs
--tty,-t                 Выделить псевдо-TTY
--ulimit                 Ulimit опции
--user,-u                Имя пользователя или UID (формат: <name|uid>[:<group|gid>])
--userns                 Пространство имен пользователя для использования
--uts                    пространство имен UTS для использования
--volume,-v              Привязать монтирование тома
--volume-driver          Дополнительный драйвер тома для контейнера
--volumes-from           Смонтировать тома из указанного(ых) контейнера(ов)
--workdir,-w             Рабочий каталог внутри контейнера
```

---
<a name="exec"><h2>Выполнение команды в работающем контейнере</h2></a>
### docker exec - Выполнение команды в работающем контейнере

Используется: 
- `docker exec [OPTIONS] CONTAINER COMMAND [ARG...]`

Псевдонимы:
- `docker container exec`,
- `docker exec`

```bash
docker exec test_nginx ls -al # подключиться к контейнеру по имени и ввести список файлов и папок (ls -al)
docker exec -it test_nginx sh # подключиться к контейнеру в интерактивном режиме и запусить оболочку (sh)
docker exec -w /etc/nginx/conf.d test_nginx ls # (-w) подключиться в папку и выполнить команду (ls)
docker exec -u 1000:1000  -w /etc/nginx test_nginx id # (-u) подключиться под пользователем с (id=1000) и (group=1000)
```
---
<a name="ps"><h2>Список контейнеров</h2></a>
### docker ps - Список контейнеров

Используется:
- `docker ps [OPTIONS]`

Псевдонимы:
- `docker container ls`, 
- `docker container list`, 
- `docker container ps`, 
- `docker ps`

```bash
docker ps # показать список работающих контейнеров
docker ps -a # (-a) показать список всех контейнеров
docker ps -q # (-q) показать ID работающих контейнеров
docker ps -aq # показать ID всех контейнеров
docker ps -s # (-s) отображает два размера для каждого контейнера
docker ps -as # 
docker ps -n 2 # (-n 2) показать последних 2 созданных контейнера независимо от статуса 
docker ps --last 2 # тоже самое что и выше
docker ps --no-trunc # не обрезать описания при выводе

# опция фильтр: (--filter) или (-f) 
docker ps -a --filter name=nginx # покажет контейнеры где в имени есть слово (nginx) 
docker ps -a --filter id=009 # покажет контейнеры где в ID есть 009
docker ps -a --filter status=running # status: created, restarting, running, removing, paused, exited, dead
docker ps -a --filter publish=8080 # Фильтрует контейнеры, которые публикуют или предоставляют данный порт.
docker ps -a --filter 'exited=0' # отфильтровать успешно завершенные контейнеры

docker ps --filter ancestor=ubuntu # отфильтровать  контейнеры на основе их образа (image), (image:tag)
docker ps --filter ancestor=ubuntu:22.04

docker ps -f before=9c3527ed70ce # показывает контейнеры, созданные до контейнера с заданным идентификатором или именем
docker ps -f since=6e63f6ff38b0 # показывает контейнеры, созданные после контейнера с заданным идентификатором или именем.

# формат вывода (--format)
docker ps -a --format "table {{.ID}}\t{{.Image}}" # выведет (ID контейнеров) и (названия образов)
docker ps -ф --format "{{.ID}}: {{.Command}}" # выведет информацию без заголовоков

# .ID          Идентификатор контейнера
# .Image       Идентификатор образа
# .Command     Команда в кавычках
# .CreatedAt   Время создания контейнера.
# .RunningFor  Время, прошедшее с момента запуска контейнера.
# .Ports       Открытые порты.
# .State       Статус контейнера (например, «создан», «работает», «закрыт»).
# .Status      Статус контейнера с подробной информацией о продолжительности и состоянии работоспособности.
# .Size        Размер диска контейнера.
# .Names       Имена контейнеров.
# .Labels      Все метки, присвоенные контейнеру.
# .Label       Значение конкретной метки для этого контейнера. Например'{{.Label "com.docker.swarm.cpu"}}'
# .Mounts      Имена томов, смонтированных в этом контейнере.
# .Networks    Имена сетей, подключенных к этому контейнеру.

docker ps --format json # перечислить все запущенные контейнеры в формате JSON
```
---
<a name="build"><h2>Начать сборку образа</h2></a>
### docker build - Начать сборку образа

Используется:  
- `docker build [OPTIONS] PATH | URL | -`

Псевдонимы:
- `docker buildx build`, 
- `docker buildx b`

```bash
# построить с помощью PATH
docker build . # (.) - контекст текущая директория
# ------------------
# Создать с URL
# Это клонирует репозиторий GitHub и использует клонированный репозиторий в качестве контекста. 
# Dockerfile в корне репозитория используется как Dockerfile
docker build github.com/creack/docker-firefox

# чтобы использовать каталог, называемый docker в ветке container
docker build https://github.com/docker/rootfs.git#container:docker

# Контексты архива - сам URL-адрес отправляется демону:
docker build http://server/context.tar.gz
# ------------------
# будет читать Dockerfile из (STDIN) без контекста.
# Текстовые файлы - передать один Dockerfile через STDIN
docker build - < Dockerfile
docker build - < context.tar.gz
```

```bash
docker build -t vieux/apache:2.0 . # (-t, --tag) отметить образ 
docker build -f Dockerfile.debug . # использовать файл (Dockerfile.debug)

curl example.com/remote/Dockerfile | docker build -f - . # использовать текущий каталог в качестве контекста сборки и читать Dockerfile из стандартного ввода

docker build -f dockerfiles/Dockerfile.debug -t myapp_debug .
docker build -f dockerfiles/Dockerfile.prod  -t myapp_prod .

# команды делают одно и то же. Они оба используют содержимое файла (debug) 
# вместо поиска (Dockerfile) и будут использовать его (/home/me/myapp)
cd /home/me/myapp/some/dir/really/deep
docker build -f /home/me/myapp/dockerfiles/debug /home/me/myapp
docker build -f ../../../../dockerfiles/debug /home/me/myapp

# Установить переменные времени сборки (--build-arg)
docker build --build-arg HTTP_PROXY=http://10.20.30.2:1234 --build-arg FTP_PROXY=http://40.50.60.5:4567 .

export HTTP_PROXY=http://10.20.30.2:1234 # создаёт перемеменную в оболочке (bash)
docker build --build-arg HTTP_PROXY . # bash использует эту переменную
```

```bash
# Указание целевого этапа сборки (--target)
FROM debian AS build-env
# ...

FROM alpine AS production-env
# ...

docker build -t mybuildimage --target build-env . # (-t или --tag) установка имени и тега для создаваемого образа
```

```bash
docker builder --no-cache . # при сборке не использовать кеш
docker builder prune # Удалить кеш сборки
```

---
<a name="pull"><h2>Загрузка образа из реестра</h2></a>
### docker pull - Загрузка образа из реестра

Используется:  
- `docker pull [OPTIONS] NAME[:TAG|@DIGEST]`

Псевдонимы:
- `docker image pull`, 
- `docker pull`

```bash
docker pull nginx
docker pull nginx:1.23.3
docker pull nginx:1.23
docker pull nginx:1.23.3-alpine-slim
docker pull myregistry.local:5000/testing/test-image
```
---
<a name="push"><h2>Отправка образов в реестр</h2></a>
### docker push - Отправка образов в реестр

Используется:  
- `docker push [OPTIONS] NAME[:TAG]`

Псевдонимы:
- `docker image push`, 
- `docker push`

```bash
docker push andreysssr/nginx
docker push andreysssr/nginx:1.23.3
docker push andreysssr/nginx:1.23
docker push andreysssr/nginx:1.23.3-alpine-slim
```
---
<a name="images"><h2>Список образов</h2></a>
### docker images - Список образов

Используется:  
- `docker images [OPTIONS] [REPOSITORY[:TAG]]`

Псевдонимы:
- `docker image ls`, 
- `docker image list`, 
- `docker images`

```bash
docker images # показать список образов на локальной машине без <none> - висячих образов 
docker images -a # показать список всех образов - вместе с <none> 
docker images --no-trunc  # (--no-trunc) не усекать информацию
docker images --format json # вывести информацию в (json) формате
docker images nginx # посмотреть все образы репозитория (nginx)

# (-f или --filter)
docker images --filter "dangling=true" # Показать образы без тегов (висячие)

# показывает только образы, созданные до образов с заданным идентификатором или ссылкой
docker images --filter "before=image1"

# показывает только образы, созданные после образов с заданным идентификатором или ссылкой
docker images --filter "since=image3"
```

```bash
# Параметр форматирования вывода (--format)
docker images --format "{{.ID}}: {{.Repository}}"
docker images --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}"
docker images --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}" nginx

# .ID           Идентификатор образов
# .Repository   Репозиторий образов
# .Tag          Тег образа
# .Digest       Дайджест образа
# .CreatedSince Прошедшее время с момента создания образа
# .CreatedAt    Время создания образа
# .Size         Размер диска образа

docker images --format json # перечислить все образы в формате JSON,
```
---
<a name="login"><h2>Войти в реестр Docker</h2></a>
### docker login - Войти в реестр Docker

Используется:
- `docker login [OPTIONS] [SERVER] [flags]`
- `docker login [command]`

> Требование привилегированного пользователя
docker `login` требует, чтобы пользователь использовал `sudo` или был `root`

```bash
# войти в собственный реестр
docker login localhost:8080 

# Введите пароль, используя STDIN (username = foo) 
cat ~/my_password.txt | docker login --username foo --password-stdin
```
---
<a name="logout"><h2>Выйти из реестра Docker</h2></a>
### docker logout - Выйти из реестра Docker

Используется:
- `docker logout [SERVER] [flags]`
- `docker logout [command]`


```bash
docker logout localhost:8080 
```
---
<a name="search"><h2>Поиск образов в Docker Hub</h2></a>
### docker search - Поиск образов в Docker Hub

Используется:  
- `docker search [OPTIONS] TERM`

```bash
docker search busybox # поиск образов с именем (busybox)
docker search busybox --limit 5 # вывести не больше 5 рузультатов поиска

# Показать неусеченное описание (--no-trunc)
docker search --filter=stars=3 --no-trunc busybox # отображаются образы с именем, содержащим «busybox», не менее 3 звезд,
docker search --filter is-automated=true --filter stars=3 busybox # 
docker search --filter is-official=true busybox # 
docker search --filter is-official=true --filter stars=3 busybox

# stars (int - количество звезд у образа)
# is-automated (boolean - true или false) - образ автоматизирован или нет
# is-official (boolean - true или false) - официальный образ или нет
```
```bash
# Отформатируйте вывод (--format)
docker search --format "{{.Name}}: {{.StarCount}}" nginx
docker search --format "table {{.Name}}\t{{.IsAutomated}}\t{{.IsOfficial}}" nginx

# .Name         Имя образов
# .Description  Описание образа
# .StarCount    Количество звезд для образа
# .IsOfficial   «ОК», если образ официальный
# .IsAutomated  «ОК», если сборка образа была автоматизирована
```
---
<a name="version"><h2>Отображение сведений о версии Docker</h2></a>
### docker version - Отображение сведений о версии Docker

Используется:
- `docker version [flags]`

```bash
docker version 
docker version --format '{{.Client.APIVersion}}'
docker version --format '{{.Server.Version}}'
```
```
user@user-desktop:~$ docker version
Client: Docker Engine - Community
 Version:           23.0.1
 API version:       1.42
 Go version:        go1.19.5
 Git commit:        a5ee5b1
 Built:             Thu Feb  9 19:47:01 2023
 OS/Arch:           linux/amd64
 Context:           default

Server: Docker Engine - Community
 Engine:
  Version:          23.0.1
  API version:      1.42 (minimum version 1.12)
  Go version:       go1.19.5
  Git commit:       bc3805a
  Built:            Thu Feb  9 19:47:01 2023
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.6.19
  GitCommit:        1e1ea6e986c6c86565bc33d52e34b81b3e2bc71f
 runc:
  Version:          1.1.4
  GitCommit:        v1.1.4-0-g5fd4c4d
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0
```

---
<a name="info"><h2>Отображение общесистемной информации</h2></a>
### docker info - Отображение общесистемной информации

Используется:  
- `docker info [OPTIONS]`

Псевдонимы:
- `docker system info`,
- `docker info`

```bash
docker info
docker info --format '{{json .}}'
```
---

# Команды управления:

---
<a name="container"><h2>Управление контейнерами </h2></a>
### docker container - Управление контейнерами  

Используется:  
- `docker container COMMAND`

```bash
#COMMAND:
#  attach      Присоединение локальных стандартных входных, выходных потоков и потоков ошибок к работающему контейнеру
#  commit      Создание нового образа из изменений контейнера
#  cp          Копирование папок между контейнером и локальной файловой системой
#  create      Создание нового контейнера
#  diff        Проверка изменений в файлах или каталогах в файловой системе контейнера
#  exec        Выполнение команды в работающем контейнере
#  export      Экспорт файловой системы контейнера в виде архива tar
#  inspect     Отображение подробной информации об одном или нескольких контейнерах
#  kill        Уничтожение одного или нескольких работающих контейнеров
#  logs        Получение журналов контейнера
#  ls          Список контейнеров
#  pause       Приостановка всех процессов в одном или нескольких контейнерах
#  port        Список сопоставлений портов или конкретного сопоставления для контейнера
#  prune       Удалить все остановленные контейнеры
#  rename      Переименование контейнера
#  restart     Перезапуск одного или нескольких контейнеров
#  rm          Удаление одного или нескольких контейнеров
#  run         Создание и запуск нового контейнера из образа
#  start       Запуск одного или нескольких остановленных контейнеров
#  stats       Отображение динамического потока статистики использования ресурсов контейнера (контейнеров)
#  stop        Остановка одного или нескольких запущенных контейнеров
#  top         Отображение запущенных процессов контейнера
#  unpause     Отмена приостановки всех процессов в одном или нескольких контейнерах
#  update      Обновление конфигурации одного или нескольких контейнеров
#  wait        Блокировка до тех пор, пока один или несколько контейнеров не остановятся, а затем распечатайте их коды выхода
```

---
<a name="context"><h2>Управление контекстом</h2></a>
### docker context - Управление контекстом  
Используется:
- `docker context [command]`

```
Commands:
docker context create  # Создать контекст
docker context export  # Экспорт контекста в ФАЙЛ архива tar или поток tar в STDOUT.
docker context import  # Импорт контекста из файла tar или zip
docker context inspect # Отображение подробной информации об одном или нескольких контекстах
docker context ls      # Список контекстов
docker context rm      # Удалить один или несколько контекстов
docker context show    # Напечатать имя текущего контекста
docker context update  # Обновить контекст
docker context use     # Установить текущий контекст докера  
```

```bash
# Создайте контекст с конечной точкой докера
docker context create \
    --docker host=unix:///var/run/docker.sock \
    my-context
    
# Создать контекст на основе существующего контекста
docker context create --from existing-context my-context
docker context inspect "default" # Отображение подробной информации об одном или нескольких контекстах
docker context ls # Список контекстов
docker context rm my-context # Удалить один или несколько контекстов
docker context show # Напечатать имя текущего контекста
docker context use default # Установить текущий контекст докера 
```

---
<a name="image"><h2>Управление образами</h2></a>
### docker image - Управление образами  

Используется:  
- `docker image COMMAND:`

```bash
# Commands:
docker image build   # Создайте образ из Dockerfile
docker image history # Показать историю образа
docker image import  # Импортируйте содержимое из архива для создания образа файловой системы.
docker image inspect # Отображение подробной информации об одном или нескольких образах
docker image load    # Загрузите образ из архива tar или STDIN
docker image ls      # Список образов
docker image prune   # Удалить неиспользуемые образы
docker image pull    # Скачать образ из реестра
docker image push    # Загрузить образ в реестр
docker image rm      # Удалить одно или несколько образов
docker image save    # Сохраните одно или несколько образов в tar-архив (по умолчанию передается в STDOUT)
docker image tag     # Создайте тег TARGET_IMAGE, который ссылается на SOURCE_IMAGE.
```

```bash
# build       Создайте образ из Dockerfile
docker image build [OPTIONS] PATH | URL | -

# --add-host          Добавить пользовательское сопоставление хоста с IP-адресом ( host:ip)
# --build-arg         Установить переменные времени сборки
# --cache-from        Образы, которые следует рассматривать как источники кеша
# --cgroup-parent     Необязательная родительская контрольная группа для контейнера
# --compress          Сжать контекст сборки с помощью gzip
# --cpu-period        Ограничьте период CPU CFS (Completely Fair Scheduler).
# --cpu-quota         Ограничьте квоту CPU CFS (Completely Fair Scheduler).
# --cpu-shares,-c     Доли ЦП (относительный вес)
# --cpuset-cpus       ЦП, в которых разрешено выполнение (0-3, 0,1)
# --cpuset-mems       MEM, в которых разрешено выполнение (0-3, 0,1)
# --disable-content-trust	true	Пропустить проверку образа
# --file,-f           Имя Dockerfile (по умолчанию PATH/Dockerfile)
# --force-rm          Всегда удаляйте промежуточные контейнеры
# --iidfile           Запишите идентификатор образа в файл
# --isolation         Технология изоляции контейнеров
# --label             Установить метаданные для образа
# --memory,-m         Лимит памяти
# --memory-swap       Ограничение подкачки равно памяти плюс подкачка: -1 для включения неограниченной подкачки
# --network           Установите сетевой режим для инструкций RUN во время сборки.
# --no-cache          Не использовать кеш при построении образа
# --platform          Установите платформу, если сервер поддерживает многоплатформенность
# --pull              Всегда пытайтесь получить более новую версию образа
# --quiet,-q          Подавить вывод сборки и распечатать идентификатор образа в случае успеха
# --rm	true          Удалить промежуточные контейнеры после успешной сборки
# --security-opt      Параметры безопасности
# --shm-size          Размер/dev/shm
# --squash            экспериментальный (демон)
# 
# Склеить вновь созданные слои в один новый слой
# --tag,-t		Имя и, возможно, тег в name:tag формате
# --target		Установите целевую стадию сборки для сборки.
# --ulimit		Ulimit опции
```

```bash
# Показать историю образа
docker image history nginx 

# Импортируйте содержимое из архива для создания образа файловой системы.
docker image import [OPTIONS] file|URL|- [REPOSITORY[:TAG]]

# Отображение подробной информации об одном или нескольких образах
docker image inspect [OPTIONS] IMAGE [IMAGE...]

# Загрузите образ из архива tar или STDIN
docker image load [OPTIONS]

# Список образов
docker image ls [OPTIONS] [REPOSITORY[:TAG]]

# Удалить неиспользуемые образы
docker image prune # Удалите только висящие образы (none)
docker image prune -a # Удалите все неиспользуемые образы, а не только висящие.

# Скачать образ из реестра
docker image pull [OPTIONS] NAME[:TAG|@DIGEST]

# Загрузить образ в реестр
docker image push [OPTIONS] NAME[:TAG]

# Удалить одно или несколько образов
docker image rm nginx 
docker image rm nginx mysql
docker image rm --force nginx # (--force или -f) Принудительно удалить образы

# Сохраните одно или несколько образов в tar-архив (по умолчанию передается в STDOUT)
docker image save [OPTIONS] IMAGE [IMAGE...]
docker image save -o my_nginx.tar IMAGE  # Запись в файл вместо STDOUT

# Создайте тег TARGET_IMAGE, который ссылается на SOURCE_IMAGE.
docker image tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
docker image tag nginx:1.23 andreysssr/nginx:3.33.3
```

---
<a name="network"><h2>Управление сетями</h2></a>
### docker network - Управление сетями  

Используется:  
- `docker network COMMAND:`

```
docker network connect    # Подключить контейнер к сети
docker network create     # Создать сеть
docker network disconnect # Отключить контейнер от сети
docker network inspect    # Отображение подробной информации об одной или нескольких сетях
docker network ls         # Список сетей
docker network prune      # Удалить все неиспользуемые сети
docker network rm         # Удалить одну или несколько сетей
```

```bash
docker network connect [OPTIONS] NETWORK CONTAINER
# [OPTIONS]
# --alias         Добавить псевдоним для контейнера с областью действия сети
# --driver-opt    параметры драйвера для сети
# --ip            IPv4-адрес (например, 172.30.100.104)
# --ip6           IPv6-адрес (например, 2001:db8::33)
# --link          Добавить ссылку на другой контейнер
# --link-local-ip Добавьте локальный адрес ссылки для контейнера

# Подключить работающий контейнер к сети
docker network connect multi-host-network container1

# Подключить контейнер к сети при его запуске 
docker run -itd --network=multi-host-network busybox

# Вы можете указать IP-адрес, который хотите назначить интерфейсу контейнера.
docker network connect --ip 10.10.36.122 multi-host-network container2

# Создайте сетевой псевдоним для контейнера (--alias)
docker network connect --alias db --alias mysql multi-host-network container2
```
```bash
# Создать сеть
docker network create [OPTIONS] NETWORK

# --attachable    Включить ручное прикрепление контейнера
# --aux-address   Вспомогательные адреса IPv4 или IPv6, используемые сетевым драйвером
# --config-from   Сеть, из которой копируется конфигурация
# --config-only   Создать сеть только для конфигурации
# --driver,-d     Драйвер для управления сетью (default "bridge")
# --gateway       Шлюз IPv4 или IPv6 для главной подсети
# --ingress       Создайте ячеистую сеть маршрутизации роя
# --internal      Ограничить внешний доступ к сети
# --ip-range      Выделить IP-адрес контейнера из поддиапазона
# --ipam-driver   Драйвер управления IP-адресами
# --ipam-opt      Установите специальные параметры драйвера IPAM
# --ipv6          Включить сеть IPv6
# --label         Установить метаданные в сети
# --opt,-o        Установить специальные параметры драйвера
# --scope         Контролируйте масштаб сети
# --subnet        Подсеть в формате CIDR, представляющая сегмент сети
```

---
<a name="system"><h2>Управление докером</h2></a>
### docker system - Управление докером  

Используется:  
- `docker system COMMAND:`

```bash
docker system df     # Показать использование док-диска
docker system df -v  # Показать использование док-диска подробно
docker system events # Получайте события в реальном времени с сервера

# Псевдонимы:
# - `docker system events`,
# - `docker events`

# фильтрация событий опция (--filter или -f)
# Фильтр событий по времени
docker system events --since 1483283804
docker system events --since '2017-01-05'
docker system events --since '2013-09-03T15:49:29'
docker system events --since '10m'

# Фильтр событий по критериям
docker system events --filter 'type=container'
docker system events --filter 'event=stop'
docker system events --filter 'image=alpine'
docker system events --filter 'container=test'
docker system events --filter 'container=test' --filter 'container=d9cdb1525ea8'
docker system events --filter 'container=test' --filter 'event=stop'
docker system events --filter 'type=volume'
docker system events --filter 'type=network'
docker system events --filter 'type=plugin'

# Отформатируйте вывод (--format)
docker system events --filter 'type=container' --format 'Type={{.Type}}  Status={{.Status}}  ID={{.ID}}'
docker system events --format '{{json .}}'

# Отображение общесистемной информации (--format или -f)
docker system info

# Удалить неиспользуемые данные
docker system prune -a # (--all или -a) Удалите все неиспользуемые образы, а не только висящие.
docker system prune -a -f # (-f) Не запрашивать подтверждение

# По умолчанию тома не удаляются, чтобы удалить тома используйте флаг (--volumes)
docker system prune -a --volumes
```

---
<a name="volume"><h2>Управление томами</h2></a>
### docker volume - Управление томами

Используется:  
- `docker volume COMMAND:`

```bash
# docker volume create [OPTIONS] [VOLUME]
docker volume create db_mysql_8     # Создать том
docker volume create db_postgres_12 # Создать том
docker volume create db_postgres_14 # Создать том

docker volume inspect db_mysql_8    # выводит детальную информацию об одном или нескольких томах
docker volume ls                    # список томов 
docker volume prune                 # Удалить все неиспользуемые локальные тома
docker volume rm db_mysql_8 db_postgres_12 # Удалить один или несколько томов
```
---

# Команды:

---
<a name="attach"><h2>Прикрепите локальные стандартные потоки ввода, вывода и ошибок к работающему контейнеру</h2></a>
### docker attach - Прикрепите локальные стандартные потоки ввода, вывода и ошибок к работающему контейнеру.  

Используется:  
- `docker attach [Options:] CONTAINER`

Псевдонимы:
- `docker container attach`, 
- `docker attach`

```bash
# контейнер был запущен без опций -i, и -t , 
# (CTRL-p CTRL-q) последовательность клавиш отключения по умолчанию не дает никакого эффекта,
# сигналы перенаправляются в присоединенный процесс 
# (CTRL-C) завершает работу контейнера:
docker run -d --name topdemo ubuntu:22.04 /usr/bin/top -b 
docker attach topdemo
# CTRL-C # завершает работу контейнера

# запускаем с опциями -i, и -t 
docker run -dit --name topdemo2 ubuntu:22.04 /usr/bin/top -b
docker attach topdemo2
# (CTRL-p CTRL-q) # при нажатии последовательности команда (attach) отсоединяется от контейнера
# (docker ps) показывает, что контейнер все еще работает в фоновом режиме
```
---
<a name="commit"><h2>Создать новый образ из изменений контейнера</h2></a>
### docker commit - Создать новый образ из изменений контейнера  

Используется:  
- `docker commit [Options:] CONTAINER [REPOSITORY[:TAG]]`

Псевдонимы:
- `docker container commit`, 
- `docker commit`

```bash
docker commit app_web andreysssr/web:1.0.0
docker commit c3f279d17e0a  svendowideit/testimage:version3

# Зафиксировать контейнер с новыми конфигурациями (--change)
docker commit --change "ENV DEBUG=true" c3f279d17e0a  svendowideit/testimage:version3

# Коммит контейнер с новинками CMDи EXPOSE инструкцией
docker commit --change='CMD ["apachectl", "-DFOREGROUND"]' -c "EXPOSE 80" c3f279d17e0a  svendowideit/testimage:version4
docker run -d svendowideit/testimage:version4
```
---
<a name="cp"><h2>Скопируйте папки с файлами между контейнером и локальной файловой системой</h2></a>
### docker cp - Скопируйте папки с файлами между контейнером и локальной файловой системой.  

Используется:  
- `docker cp [Options:] CONTAINER:SRC_PATH DEST_PATH`
- `docker cp [Options:] SRC_PATH|- CONTAINER:DEST_PATH`

> Используйте '-' в качестве источника для чтения tar-архива со стандартного ввода.
и извлеките его в каталог назначения в контейнере.
Используйте «-» в качестве места назначения для потоковой передачи tar-архива
источник контейнера на стандартный вывод.

```bash
# Копирование файла из контейнера службы в локальную файловую систему:
docker cp my-service:~/path/to/myfile ~/local/path/to/copied/file

# Мы также можем копировать из локальной файловой системы во все запущенные контейнеры службы:
docker cp --all ~/local/path/to/source/file my-service:~/path/to/copied/file
```
---
<a name="create"><h2>Создать новый контейнер</h2></a>
### docker create - Создать новый контейнер  

Используется:  
- `docker create [Options:] IMAGE [COMMAND:] [ARG...]`

Псевдонимы:
- `docker container create`, 
- `docker create`

```bash
# Создайте и запустите контейнер
docker container create -i -t --name mycontainer alpine
docker container start --attach -i mycontainer

# Инициализировать тома
docker create -v /data --name data ubuntu
docker run --rm --volumes-from data ubuntu ls -la /data
```

```
--add-host               Добавьте пользовательское сопоставление хоста с IP (хост: ip)
--attach,-a              Прикрепить к STDIN, STDOUT или STDERR
--blkio-weight           Блокировать ввод-вывод (относительный вес), от 10 до 1000 или 0 для отключения (по умолчанию 0)
--blkio-weight-device    Вес блока ввода-вывода (относительный вес устройства)
--cap-add                Добавьте возможности Linux
--cap-drop               Отбросьте возможности Linux
--cgroup-parent          Необязательная родительская контрольная группа для контейнера
--cgroupns               API 1.41+ Используемое пространство имен cgroup (host|private) 'host': Запустите контейнер в пространстве имен cgroup хоста Docker 'private': Запустите контейнер в собственном частном пространстве имен cgroup '': Используйте пространство имен cgroup, как настроено default-cgroupns- опция режима на демоне (по умолчанию)
--cidfile                Запишите идентификатор контейнера в файл
--cpu-count              Количество ЦП (только для Windows)
--cpu-percent            Процент ЦП (только для Windows)
--cpu-period             Ограничить период CPU CFS (Completely Fair Scheduler)
--cpu-quota              Ограничить квоту CPU CFS (Completely Fair Scheduler)
--cpu-rt-period          Ограничить период реального времени процессора в микросекундах
--cpu-rt-runtime         Ограничение времени работы процессора в режиме реального времени в микросекундах
--cpu-shares,-c          Доли ЦП (относительный вес)
--cpus                   Количество процессоров
--cpuset-cpus            ЦП, в которых разрешено выполнение (0-3, 0,1)
--cpuset-mems            MEM, в которых разрешено выполнение (0-3, 0,1)
--device                 Добавьте хост-устройство в контейнер
--device-cgroup-rule     Добавить правило в список разрешенных устройств cgroup
--device-read-bps        Ограничить скорость чтения (байт в секунду) с устройства
--device-read-iops       Ограничить скорость чтения (IO в секунду) с устройства
--device-write-bps       Ограничить скорость записи (байт в секунду) на устройство
--device-write-iops      Ограничить скорость записи (IO в секунду) на устройство
--disable-content-trust	true	Пропустить проверку образа
--dns                    Установить пользовательские DNS-серверы
--dns-option             Установить параметры DNS
--dns-search             Установить пользовательские домены поиска DNS
--domainname             Доменное имя контейнера NIS
--entrypoint             Перезаписать ENTRYPOINT образа по умолчанию.
--env,-e                 Установить переменные среды
--env-file               Чтение в файле переменных окружения
--expose                 Откройте порт или диапазон портов
--gpus                   API 1.40+ Устройства GPU для добавления в контейнер («все», чтобы передать все GPU)
--group-add              Добавьте дополнительные группы для присоединения
--health-cmd             Команда для проверки работоспособности
--health-interval        Время между запуском проверки (мс|с|м|ч) (по умолчанию 0 с)
--health-retries         Последовательные сбои, необходимые для сообщения о нездоровом
--health-start-period    Начальный период для инициализации контейнера перед запуском обратного отсчета повторных попыток работоспособности (мс | с | м | ч) (по умолчанию 0 с)
--health-timeout         Максимальное время выполнения одной проверки (мс|с|м|ч) (по умолчанию 0 с)
--help                   Использование печати
--hostname,-h            Имя узла контейнера
--init                   Запустите init внутри контейнера, который перенаправляет сигналы и собирает процессы.
--interactive,-i         Держите STDIN открытым, даже если он не подключен
--io-maxbandwidth        Максимальный предел пропускной способности ввода-вывода для системного диска (только для Windows)
--io-maxiops             Максимальное ограничение IOps для системного диска (только для Windows)
--ip                     IPv4-адрес (например, 172.30.100.104)
--ip6                    IPv6-адрес (например, 2001:db8::33)
--ipc                    Режим IPC для использования
--isolation              Технология изоляции контейнеров
--kernel-memory          Ограничение памяти ядра
--label,-l               Установить метаданные в контейнере
--label-file             Чтение файла этикеток с разделителями строк
--link                   Добавить ссылку на другой контейнер
--link-local-ip          Контейнер IPv4/IPv6 link-local адреса
--log-driver             Драйвер логирования для контейнера
--log-opt                Параметры драйвера журнала
--mac-address            MAC-адрес контейнера (например, 92:d0:c6:0a:29:33)
--memory,-m              Лимит памяти
--memory-reservation     Мягкий лимит памяти
--memory-swap            Предел подкачки равен объему памяти плюс подкачка: '-1' для включения неограниченного подкачки
--memory-swappiness	-1	 Настройка подкачки памяти контейнера (от 0 до 100)
--mount                  Прикрепите монтирование файловой системы к контейнеру
--name                   Присвоить имя контейнеру
--network                Подключить контейнер к сети
--network-alias          Добавить псевдоним для контейнера с областью действия сети
--no-healthcheck         Отключите все HEALTHCHECK, указанные в контейнере.
--oom-kill-disable       Отключить убийцу OOM
--oom-score-adj          Настройте параметры OOM хоста (от -1000 до 1000)
--pid                    пространство имен PID для использования
--pids-limit             Настройте лимит PID контейнеров (установите -1 для неограниченного)
--platform               Установите платформу, если сервер поддерживает многоплатформенность
--privileged             Предоставьте расширенные права этому контейнеру
--publish,-p             Публикация портов контейнера на хосте
--publish-all,-P         Публиковать все открытые порты на случайные порты
--pull	missing	         Скачать образ перед созданием ( always, |missing, never)
--quiet,-q               Подавить вывод pull
--read-only              Смонтируйте корневую файловую систему контейнера только для чтения
--restart	no	         Политика перезапуска для применения при выходе из контейнера
--rm                     Автоматически удалять контейнер при его выходе
--runtime                Время выполнения для этого контейнера
--security-opt           Параметры безопасности
--shm-size               Размер /dev/shm
--stop-signal            Сигнал для остановки контейнера
--stop-timeout           Время ожидания (в секундах) для остановки контейнера
--storage-opt            Параметры драйвера хранилища для контейнера
--sysctl                 параметры Sysctl
--tmpfs                  Смонтировать каталог tmpfs
--tty,-t                 Выделить псевдо-TTY
--ulimit                 Ulimit опции
--user,-u                Имя пользователя или UID (формат: <name|uid>[:<group|gid>])
--userns                 Пространство имен пользователя для использования
--uts                    пространство имен UTS для использования
--volume,-v              Привязать монтирование тома
--volume-driver          Дополнительный драйвер тома для контейнера
--volumes-from           Смонтировать тома из указанного(ых) контейнера(ов)
--workdir,-w             Рабочий каталог внутри контейнера
```

---
<a name="diff"><h2>Проверяйте изменения в файлах или каталогах в файловой системе контейнера</h2></a>
### docker diff - Проверяйте изменения в файлах или каталогах в файловой системе контейнера.  

Используется:  
- `docker diff CONTAINER`

Псевдонимы:
- `docker container diff`, 
- `docker diff`

```bash
docker diff 1fdfd1f54c1b
```
---
<a name="events"><h2>Получайте события в реальном времени с сервера</h2></a>
### docker events - Получайте события в реальном времени с сервера  

Используется:  
- `docker events [Options:]`

Псевдонимы:
- `docker system events`,
- `docker events`
```bash
# фильтрация событий опция (--filter или -f)
# Фильтр событий по времени
docker events --since 1483283804
docker events --since '2017-01-05'
docker events --since '2013-09-03T15:49:29'
docker events --since '10m'

# Фильтр событий по критериям
docker events --filter 'type=container'
docker events --filter 'event=stop'
docker events --filter 'image=alpine'
docker events --filter 'container=test'
docker events --filter 'container=test' --filter 'container=d9cdb1525ea8'
docker events --filter 'container=test' --filter 'event=stop'
docker events --filter 'type=volume'
docker events --filter 'type=network'
docker events --filter 'type=plugin'

# Отформатируйте вывод (--format)
docker events --filter 'type=container' --format 'Type={{.Type}}  Status={{.Status}}  ID={{.ID}}'
docker events --format '{{json .}}'
```
---
<a name="export"><h2>Экспорт файловой системы контейнера в виде tar-архива</h2></a>
### docker export - Экспорт файловой системы контейнера в виде tar-архива  

Используется:  
- `docker export [Options:] CONTAINER`

Псевдонимы:
- `docker container export`,
- `docker export`

```bash
# Экспорт файловой системы контейнера в виде tar-архива
docker export red_panda > latest.tar

# (--output или -o) Запись в файл вместо STDOUT
docker export --output="latest.tar" red_panda # то же самое что и выше
```

---
<a name="import"><h2>Импортируйте содержимое из архива для создания образа файловой системы</h2></a>
### docker import - Импортируйте содержимое из архива для создания образа файловой системы.

Используется:
- `docker import [Options:] file|URL|- [REPOSITORY[:TAG]]`

Псевдонимы:
- `docker image import`,
- `docker import`

```bash
# --change, -c   Применить инструкцию Dockerfile к созданному образу
# --message,-m   Установить сообщение фиксации для импортированного образа
# --platform     Установите платформу, если сервер поддерживает многоплатформенность

# Это создает новый образ без тегов.
docker import https://example.com/exampleimage.tgz

# Импорт из локального файла
cat exampleimage.tgz | docker import - exampleimagelocal:new

# Импорт с сообщением фиксации.
cat exampleimage.tgz | docker import --message "New image imported from tarball" - exampleimagelocal:new

# Импорт в докер из локального архива.
docker import /path/to/exampleimage.tgz

# Импорт из локального каталога 
sudo tar -c . | docker import - exampleimagedir

# Импорт из локальной директории с новыми конфигурациями
sudo tar -c . | docker import --change "ENV DEBUG=true" - exampleimagedir
```

---
<a name="history"><h2>Показать историю образа</h2></a>
### docker history - Показать историю образа  

Используется:  
- `docker history [Options:] IMAGE`

Псевдонимы:
- `docker image history`,
- `docker history`

```bash
docker history docker:scm

# [Options:] 
# --format      'json'
# --human,-H    true  Печатайте размеры и даты в удобочитаемом формате
# --no-trunc    Не обрезать вывод
# --quiet,-q    Показывать только идентификаторы образов

docker history --format "{{.ID}}: {{.CreatedSince}}" busybox
# Отформатируйте вывод (--format)
# .ID           Идентификатор образа
# .CreatedSince Время, прошедшее с момента создания образа, если --human=true, в противном случае отметка времени создания образа.
# .CreatedAt    Отметка времени создания образа
# .CreatedBy    Команда, которая использовалась для создания образа
# .Size         Размер диска образа
# .Comment      Комментарий к образу
```
---
<a name="inspect"><h2>Возврат низкоуровневой информации об объектах Docker.</h2></a>
### docker inspect - Возврат низкоуровневой информации об объектах Docker.  

Используется:  
- `docker inspect [Options:] NAME|ID [NAME|ID...]`

> По умолчанию docker `inspect` результаты отображаются в виде массива `JSON`.

```bash
# Укажите тип цели (--type)
# --type container|image|node|network|secret|service|volume|task|plugin

docker inspect 0e5574283393 # ID контейнера
docker inspect mycontainer  # название контейнера

docker inspect --type=volume myvolume

# Проверить размер контейнера (-s, --size)
docker inspect --size mycontainer

docker run --name database -d redis
docker inspect --size database -f '{{ .SizeRootFs }}'
docker inspect --size database -f '{{ .SizeRw }}'
docker exec database fallocate -l 1000 /newfile
docker inspect --size database -f '{{ .SizeRw }}'

# Вы можете довольно просто выбрать любое поле из JSON

# Получить IP-адрес экземпляра 
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $INSTANCE_ID

# Получить MAC-адрес инстанса
docker inspect --format='{{range .NetworkSettings.Networks}}{{.MacAddress}}{{end}}' $INSTANCE_ID

# Получить путь к журналу экземпляра
docker inspect --format='{{.LogPath}}' $INSTANCE_ID

# Получить имя образа экземпляра
docker inspect --format='{{.Config.Image}}' $INSTANCE_ID

# получить IP Address 
docker inspect --format='{{.NetworkSettings.IPAddress}}' $INSTANCE_ID

# получить переменные окружения
docker inspect --format='{{.Config.Env}}' $INSTANCE_ID

# Список всех привязок портов
docker inspect --format='{{range $p, $conf := .NetworkSettings.Ports}} {{$p}} -> {{(index $conf 0).HostPort}} {{end}}' $INSTANCE_ID

# Получить подраздел в формате JSON
docker inspect --format='{{json .Config}}' $INSTANCE_ID
```
---
<a name="kill"><h2>Завершить один или несколько запущенных контейнеров</h2></a>
### docker kill - Завершить один или несколько запущенных контейнеров  

Используется:  
- `docker kill [Options:] CONTAINER [CONTAINER...]`

Псевдонимы:
- `docker container kill`,
- `docker kill`

>man-страница стандартных сигналов Linux 
>https://man7.org/linux/man-pages/man7/signal.7.html
>SIGKILL = 9

```bash
# (SIGKILL) сигнал по умолчанию отправляется в контейнер с именем my_container
docker kill my_container

# Отправить пользовательский сигнал в контейнер (--signal)
# Пользовательский сигнал можно указать либо по имени , либо по номеру 
# нижестоящие команды одинаковы
docker kill --signal=SIGHUP  my_container # SIGHUP = 1
docker kill --signal=HUP my_container
docker kill --signal=1 my_container
```
---
<a name="load"><h2>Загрузите образ из архива tar или STDIN </h2></a>
### docker load - Загрузите образ из архива tar или STDIN  

Используется:  
- `docker load [Options:]`

Псевдонимы:
- `docker image load`,
- `docker load`

```bash
# --input,-i Чтение из файла архива tar вместо STDIN
# --quiet,-q Подавить вывод нагрузки

# Загружать образ из STDIN 
docker load < busybox.tar.gz

# Загрузить образ из файла
docker load --input fedora.tar
```
---
<a name="logs"><h2>Получить журналы контейнера</h2></a>
### docker logs - Получить журналы контейнера  

Используется:  
- `docker logs [Options:] CONTAINER`

Псевдонимы:
- `docker container logs`,
- `docker logs`

>Команда `docker logs` пакетно извлекает журналы, существующие на момент выполнения.  
>Команда `docker logs --follow` продолжит потоковую передачу нового вывода из контейнера `STDOUT` и `STDERR`.  
>Команда `docker logs --details` добавит дополнительные атрибуты, такие как переменные среды и метки, предоставленные `--log-opt` при создании контейнера

```bash
# --details       Показать дополнительные сведения, указанные в журналах
# --follow,-f     Следить за выводом журнала
# --since         Показать журналы с отметкой времени (например 2013-01-02T13:23:37Z, ) или относительной (например, 42m за 42 минуты)
# --tail,-n all   Количество строк, отображаемых с конца журналов
# --timestamps,-t Показать временные метки
# --until         Показывать журналы перед отметкой времени (например, 2013-01-02T13:23:37Z) или относительной (например, 42m за 42 минуты)

docker logs -f --until=2s test # получить журналы до определенного момента времени
```
---
<a name="pause"><h2>Приостановить все процессы в одном или нескольких контейнерах</h2></a>
### docker pause - Приостановить все процессы в одном или нескольких контейнерах  

Используется:  
- `docker pause CONTAINER [CONTAINER...]`

Псевдонимы:
- `docker container pause`,
- `docker pause`

```bash
docker pause my_container
```

---
<a name="unpause"><h2>Разблокировать все процессы в одном или нескольких контейнерах</h2></a>
### docker unpause - Разблокировать все процессы в одном или нескольких контейнерах

Используется:
- `docker unpause CONTAINER [CONTAINER...]`

Псевдонимы:
- `docker container unpause`,
- `docker unpause`

```bash
docker unpause my_container
```
---
<a name="port"><h2>Список сопоставлений портов или конкретное сопоставление для контейнера</h2></a>
### docker port - Список сопоставлений портов или конкретное сопоставление для контейнера  

Используется:  
- `docker port CONTAINER [PRIVATE_PORT[/PROTO]]`

Псевдонимы:
- `docker container port`,
- `docker port`
```bash
docker port my_container
```
---
<a name="rename"><h2>Переименовать контейнер</h2></a>
### docker rename - Переименовать контейнер  

Используется:  
- `docker rename CONTAINER NEW_NAME`

Псевдонимы:
- `docker container rename`,
- `docker rename`

```bash
docker rename my_container my_new_container
```
---
<a name="restart"><h2>Перезапустите один или несколько контейнеров </h2></a>
### docker restart - Перезапустите один или несколько контейнеров  

Используется:  
- `docker restart [Options:] CONTAINER [CONTAINER...]`

Псевдонимы:
- `docker container restart`,
- `docker restart`

```bash
# --signal,-s Сигнал для отправки в контейнер
# --time,-t   Секунды ожидания перед уничтожением контейнера
docker restart my_container
```
---
<a name="rm"><h2>Удалить один или несколько контейнеров </h2></a>
### docker rm - Удалить один или несколько контейнеров  

Используется:  
- `docker rm [Options:] CONTAINER [CONTAINER...]`

Псевдонимы:
- `docker container rm`,
- `docker container remove`,
- `docker rm`

```bash
# --force,-f    Принудительное удаление работающего контейнера (использует SIGKILL)
# --link,-l     Удалить указанную ссылку
# --volumes,-v  Удалить анонимные тома, связанные с контейнером

docker rm redis # удаляет контейнер, на который ссылается ссылка
docker rm --force redis # принудительно удаляет работающий контейнер.
docker rm $(docker ps --filter status=exited -q) # Удалить все остановленные контейнеры
docker rm --volumes redis # Удалить контейнер и его тома

# Удаление контейнера и выборочное удаление томов 
docker create -v awesome:/foo -v /bar --name hello redis
docker rm -v hello 
```
---
<a name="rmi"><h2>Удалить один или несколько образов</h2></a>
### docker rmi - Удалить один или несколько образов  

Используется:  
- `docker rmi [Options:] IMAGE [IMAGE...]`

Псевдонимы:
- `docker image rm`,
- `docker image remove`,
- `docker rmi`

```bash
# --force,-f Принудительно удалить образ
# --no-prune Не удалять непомеченных родителей

docker rmi fd484f19954f
docker rmi test1:latest
# или 
docker rmi fd484f19954f test1:latest

docker rmi -f fd484f19954f

docker rmi $(docker images -aq) # удалить все образы
docker rmi $(docker image ls -aq) # удалить все образы
```
---
<a name="save"><h2>Сохраните один или несколько образов в tar-архив (по умолчанию передается в STDOUT)</h2></a>
### docker save - Сохраните один или несколько образов в tar-архив(по умолчанию передается в STDOUT)  
Используется:  
- `docker save [Options:] IMAGE [IMAGE...]`

Псевдонимы:
- `docker image save`,
- `docker save`

```bash
# --output,-o		Запись в файл вместо STDOUT

# Создайте резервную копию, которую затем можно использовать с файлами docker load
docker save busybox > busybox.tar
docker save --output busybox.tar busybox

# Сохраните образ в файл tar.gz с помощью gzip
docker save myimage:latest | gzip > myimage_latest.tar.gz
```
---
<a name="start"><h2>Запустить один или несколько остановленных контейнеров</h2></a>
### docker start - Запустить один или несколько остановленных контейнеров  

Используется:  
- `docker start [Options:] CONTAINER [CONTAINER...]`

Псевдонимы:
- `docker container start`,
- `docker start`

```bash
# --attach,-a       Прикрепите STDOUT/STDERR и переадресуйте сигналы
# --detach-keys     Переопределить последовательность клавиш для отсоединения контейнера
# --interactive,-i  Прикрепить STDIN контейнера

docker start my_container
```
---
<a name="stats"><h2>Отображение статистики использования ресурсов контейнеров в реальном времени.</h2></a>
### docker stats - Отображение статистики использования ресурсов контейнеров в реальном времени.  

Используется:  
- `docker stats [Options:] [CONTAINER...]`

Псевдонимы:
- `docker container stats`,
- `docker stats`

> Выход из режима просмотра `(Ctrl + Shift + c)`

```bash
# --all,-a     Показать все контейнеры (по умолчанию отображаются только запущенные)
# --format     Форматирование вывода 'json'
# --no-stream  Отключить потоковую статистику и получать только первый результат
# --no-trunc   Не обрезать вывод

docker stats
docker stats awesome_brattain 67b2525d8ad1 # просмотр статистики 2 контейнеров по имени и по ID

docker stats nginx --no-stream --format "{{ json . }}"
docker stats --all --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}" fervent_panini 5acfcb1b4fd1 drunk_visvesvaraya big_heisenberg
docker stats --format "{{.Container}}: {{.CPUPerc}}"
docker stats --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}"
docker stats --format "table {{.ID}}\t{{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}\t{{.NetIO}}\t{{.BlockIO}}\t{{.PIDs}}"

# .Container  Имя или идентификатор контейнера (вводится пользователем)
# .Name       Имя контейнера
# .ID         Идентификатор контейнера
# .CPUPerc    процент ЦП
# .MemUsage   Использование памяти
# .NetIO      Сетевой ввод-вывод
# .BlockIO    Блокировать ввод-вывод
# .MemPerc    Процент памяти (недоступно в Windows)
# .PIDs       Количество PID (недоступно в Windows)

```
---
<a name="stop"><h2>Остановить один или несколько запущенных контейнеров</h2></a>
### docker stop - Остановить один или несколько запущенных контейнеров  

Используется:  
- `docker stop [Options:] CONTAINER [CONTAINER...]`

Псевдонимы:
- `docker container stop`,
- `docker stop`

```bash
# --signal,-s  Сигнал для отправки в контейнер
# --time,-t    Секунды ожидания перед уничтожением контейнера

docker stop my_container
```
---
<a name="tag"><h2>Создайте тег TARGET_IMAGE, который ссылается на SOURCE_IMAGE.</h2></a>
### docker tag - Создайте тег TARGET_IMAGE, который ссылается на SOURCE_IMAGE. 

Используется:  
- `docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]`

Псевдонимы:
- `docker image tag`,
- `docker tag`

```bash
# Отметить образ, на которое ссылается ID
docker tag 0e5574283393 fedora/httpd:version1.0
docker tag httpd fedora/httpd:version1.0
docker tag httpd:test fedora/httpd:version1.0.test
docker tag httpd:test fedora/httpd:version1.0.test
docker tag 0e5574283393 myregistryhost:5000/fedora/httpd:version1.0
```
---
<a name="top"><h2>Отображение запущенных процессов контейнера </h2></a>
### docker top - Отображение запущенных процессов контейнера  

Используется:  
- `docker top CONTAINER [ps Options:]`

Псевдонимы:
- `docker container top`, 
- `docker top`

```bash
docker top CONTAINER [ps OPTIONS]
```
