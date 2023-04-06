После первого запуска вышла ошибка.
'''
~/Flaskex$ python3 app.py
Traceback (most recent call last):
  File "/home/vir/Flaskex/app.py", line 4, in <module>
    from scripts import forms
  File "/home/vir/Flaskex/scripts/forms.py", line 6, in <module>
    class LoginForm(Form):
  File "/home/vir/Flaskex/scripts/forms.py", line 7, in LoginForm
    username = StringField('Username:', validators=[validators.required(), validators.Length(min=1, max=30)])
AttributeError: module 'wtforms.validators' has no attribute 'required'
'''

Изменил в файле forms.py -  validators.required() на validators.DataRequired()  

После чего приложение на хосте запустилось. Через браузер так же доступно.

 '''
 python3 app.py
 * Serving Flask app 'app'
 * Debug mode: on
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on all addresses (0.0.0.0)
 * Running on http://127.0.0.1:5000
 * Running on http://192.168.88.250:5000
Press CTRL+C to quit
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 185-133-891
'''

Собираем свой образ docker. Выбрал образ с установленным python. Копируем исправленное приложение в образ, 
устанавливаем зависимости. 
  docker build -t testwork .
Образ успешно собрался, затем запускаем контейнер на основе образа.
  docker run -d -p 5001:5000 --name testwork -it testwork
Контейнер стартует и сразу запускает приложенже. Приложение доступно на хосте через web по 5001 порту.

Для docker compose используем ранее собранный образ testwork с приложением внутри. И в docker compose файле 
указываем пробросить наружу порт 5001.
Запускаем контейнер: 
  docker compose up
Контейнер стартует, приложенже доступно на хосте через web по 5001 порту.