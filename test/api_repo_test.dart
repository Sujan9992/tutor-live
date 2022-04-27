import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:tutor_live/domain/repository/api_repository.dart';
import 'package:tutor_live/domain/repository/api_repository_implement.dart';
import 'package:tutor_live/domain/request/login_request.dart';
import 'package:tutor_live/domain/request/register_request.dart';
import 'package:tutor_live/domain/response/login_response.dart';
import 'package:tutor_live/modules/auth/model/user.dart';
import 'package:tutor_live/modules/courses/model/category.dart';
import 'package:tutor_live/modules/courses/model/courses.dart';
import 'package:tutor_live/modules/home/model/schedule.dart';
import 'api_repo_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late ApiRepositoryInterface apiRepositoryInterface;
  setUp(() {
    apiRepositoryInterface = ApiRepositoryImplement();
  });
  test('should return user info', () async {
    final client = MockClient();
    when(client.get(Uri.parse('https://192.168.1.78:8000/api/profile/')))
        .thenAnswer((_) async => http.Response(
            '{"id": 2,"email": "hari@gmail.com","full_name": "Hari Lal","avatar": null}',
            200));
    expect(
        await apiRepositoryInterface.getUserFromToken(
            '''eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjUxNTU0MTI1LCJpYXQiOjE2NDg5NjIxMjUsImp0aSI6ImViMjdjMjI4YmY5MTQ2ZTY4YWI4MTlmZDU3NjkzYTgxIiwidXNlcl9pZCI6Mn0.xF17ghhYcIq6uOqWRaYG6Jz7gvuhVVGpC5r49ETSO84'''),
        isA<LoginResponse>());
  });

  test('throws an exception if the http call completes with an error', () {
    final client = MockClient();

    when(client.get(Uri.parse('https://192.168.1.78:8000/api/profile/')))
        .thenAnswer((_) async => http.Response('Not Found', 404));
    expect(apiRepositoryInterface.getUserFromToken(''), throwsException);
  });

  test('should login user', () async {
    final client = MockClient();
    when(client.get(
      Uri.parse('https://192.168.1.78:8000/api/login/'),
    )).thenAnswer((_) async => http.Response(
        '''{"user": {"id": 2,"email": "hari@gmail.com", full_name: "Hari Lal", avatar: null}, "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjUzNTc0NDc5LCJpYXQiOjE2NTA5ODI0NzksImp0aSI6IjgzZmY2ZDNmZmIxYjQwYmI5NTJkOThhZTBiOGQwMWYzIiwidXNlcl9pZCI6Mn0.VtwtZmO_cOzOSf0TGRde7i3ggwz0I9R6njgBjGTQSu0", message: "Login Successfully"}''',
        200));
    expect(
        await apiRepositoryInterface
            .login(const LoginRequest('hari@gmail.com', "12345678")),
        isA<LoginResponse>());
  });

  test('throws an exception if the http call completes with an error', () {
    final client = MockClient();

    when(client.get(Uri.parse('https://192.168.1.78:8000/api/login/')))
        .thenAnswer((_) async => http.Response('Not Found', 404));
    expect(
        apiRepositoryInterface.login(const LoginRequest('hari@gmail.com', "")),
        throwsException);
  });

  test('should register user', () async {
    final client = MockClient();
    when(client.get(
      Uri.parse('https://192.168.1.78:8000/api/register/'),
    )).thenAnswer((_) async => http.Response(
        '''{"user": {"id": 10,"email": "sam4@gmail.com", full_name: "sam Lal", avatar: null}, "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ
        9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjUzNTc0NDc5LCJpYXQiOjE2NTA5ODI0NzksImp0aSI6IjgzZmY2ZDNmZmIxYjQwYmI5NTJkOThhZTBiOGQ
        wMWYzIiwidXNlcl9pZCI6Mn0.VtwtZmO_cOzOSf0TGRde7i3ggwz0I9R6njgBjGTQSu0", message: "User registration successful"}''',
        200));
    expect(
        await apiRepositoryInterface.register(
            const RegisterRequest('sam lal', 'sam4@gmail.com', "12345678")),
        isA<LoginResponse>());
  });

  test('throws an exception if the http call completes with an error', () {
    final client = MockClient();

    when(client.get(Uri.parse('https://192.168.1.78:8000/api/register/')))
        .thenAnswer((_) async => http.Response('Not Found', 404));
    expect(
        apiRepositoryInterface
            .register(const RegisterRequest('', 'sam@gmail.com', "")),
        throwsException);
  });

  test('should return categories info', () async {
    final client = MockClient();
    when(client.get(
      Uri.parse('https://192.168.1.78:8000/api/categories/'),
    )).thenAnswer((_) async => http.Response(
        '[{"title": "Business"},{"title": "History"},{"title": "Law"},{"title": "Programming"}]',
        200));
    expect(await apiRepositoryInterface.getCategories(), isA<List<Category>>());
  });

  test('should return categories by course', () async {
    final client = MockClient();
    when(client.get(
      Uri.parse(
          'https://192.168.1.78:8000/api/courses_byCategory/Programming/'),
    )).thenAnswer((_) async => http.Response(
        '''[{"course_id":4,"title":"Learn Flutter","keywords":"flutter","description"
        :"Learn Dart and Flutter","image":"/images/course/flutter.png","category":"Pr
        ogramming","created_by":4},{"course_id":5,"title":"Learn Java","keywords":"jav
        a","description":"Learn about Java","image":"/images/course/java.jpg","category
        ":"Programming","created_by":3},{"course_id":6,"title":"Python","keywords":"pyt
        hon","description":"Learn about Python","image":"/images/course/python_101.png
        ","category":"Programming","created_by":3}]''', 200));
    expect(await apiRepositoryInterface.getCoursesByCategory('Programming'),
        isA<List<Courses>>());
  });

  test('throws an exception if the http call completes with an error', () {
    final client = MockClient();

    when(client.get(
            Uri.parse('https://192.168.1.78:8000/api/courses_by_category/')))
        .thenAnswer((_) async => http.Response('Not Found', 404));
    expect(apiRepositoryInterface.getCoursesByCategory(''), throwsException);
  });

  test('should return courses', () async {
    final client = MockClient();
    when(client.get(
      Uri.parse('https://192.168.1.78:8000/api/courses/'),
    )).thenAnswer((_) async => http.Response(
        '''[{"course_id":1,"title":"Economics","keywords":"economics","description"
        :"Learn Economics","image":"/images/course/economics.jpg","category":"Busin
        ess","created_by":5},{"course_id":2,"title":"Civil War","keywords":"war","d
        escription":"Learn about civil war","image":"/images/course/civil_War.jpg"
        ,"category":"History","created_by":2},{"course_id":3,"title":"Constitution
        ","keywords":"law","description":"Learn about constitution of Nepal","imag
        e":"/images/course/law.jpg","category":"Law","created_by":3},{"course_id":
        4,"title":"Learn Flutter","keywords":"flutter","description":"Learn Dart a
        nd Flutter","image":"/images/course/flutter.png","category":"Programming","
        created_by":4},{"course_id":5,"title":"Learn Java","keywords":"java","descr
        iption":"Learn about Java","image":"/images/course/java.jpg","category":"Pr
        ogramming","created_by":3},{"course_id":6,"title":"Python","keywords":"py
        thon","description":"Learn about Python","image":"/images/course/python_1
        01.png","category":"Programming","created_by":3}]''', 200));
    expect(await apiRepositoryInterface.getCourses(), isA<List<Courses>>());
  });

  test('should return user info', () async {
    final client = MockClient();
    when(client.get(
      Uri.parse('https://192.168.1.78:8000/api/user-profile/'),
    )).thenAnswer((_) async => http.Response(
        '{"id": 2, "email": "hari@gmail.com", "full_name": "Hari Lal", "avatar": null}',
        200));
    expect(
        await apiRepositoryInterface.getUserProfile(
            '''eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjUxNTU0MTI1LCJpYXQiOjE2NDg5NjIxMjUsImp0aSI6ImViMjdjMjI4YmY5MTQ2ZTY4YWI4MTlmZDU3NjkzYTgxIiwidXNlcl9pZCI6Mn0.xF17ghhYcIq6uOqWRaYG6Jz7gvuhVVGpC5r49ETSO84'''),
        isA<User>());
  });

  test('throws an exception if the http call completes with an error', () {
    final client = MockClient();

    when(client.get(Uri.parse('https://192.168.1.78:8000/api/user_rofile/')))
        .thenAnswer((_) async => http.Response('Not Found', 404));
    expect(apiRepositoryInterface.getUserProfile(''), throwsException);
  });

  test('should return tutor list', () async {
    final client = MockClient();
    when(client.get(
      Uri.parse('https://192.168.1.78:8000/api/get_tutors/'),
    )).thenAnswer((_) async => http.Response(
        '''[{"id":2,"email":"hari@gmail.com","full_name":"Hari Lal","avatar":null},
        {"id":3,"email":"Ram@gmail.com","full_name":"Ram Rai","avatar":"/images/avatar
        s/images.jpg"},{"id":4,"email":"Shyam@gmail.com","full_name":"Shyam Sharma"
        ,"avatar":"/images/avatars/images1.jpg"},{"id":5,"email":"gita@gmail.com","f
        ull_name":"Gita Gautam","avatar":"/images/avatars/images2.jpg"}]''',
        200));
    expect(await apiRepositoryInterface.getTutorList(), isA<List<User>>());
  });

  test('should return tutor by category', () async {
    final client = MockClient();
    when(client.get(
      Uri.parse(
          'https://192.168.1.78:8000/api/getTutorsByCategory/Programming/'),
    )).thenAnswer((_) async => http.Response(
        '''[{"id":3,"email":"Ram@gmail.com","full_name":"Ram Rai","avatar":"/ima
        ges/avatars/images.jpg"},{"id":4,"email":"Shyam@gmail.com","full_name":"S
        hyam Sharma","avatar":"/images/avatars/images1.jpg"}]''', 200));
    expect(await apiRepositoryInterface.getTutorByCategory('Programming'),
        isA<List<User>>());
  });

  test('throws an exception if the http call completes with an error', () {
    final client = MockClient();

    when(client.get(
            Uri.parse('https://192.168.1.78:8000/api/getTutorsByCategory/')))
        .thenAnswer((_) async => http.Response('Not Found', 404));
    expect(apiRepositoryInterface.getTutorByCategory(''), throwsException);
  });

  test('should return schedules', () async {
    final client = MockClient();
    when(client.get(
      Uri.parse('https://192.168.1.78:8000/api/all_schedules/'),
    )).thenAnswer((_) async => http.Response('''
[{"course_id":1,"title":"Economics","sunday":"1:00 pm - 2:00 pm","monday":"2:00 pm
- 2:50 pm","tuesday":"1:15 pm - 2:00 pm","wednesday":"2:00 pm - 3:00 pm","thursday"
:"2:00 pm - 2:30 pm","friday":"2:00 pm - 3:00 pm","saturday":"No Classes"},
{"course_id":2,"title":"Civil War","sunday":"No Classes","monday":"2:00 pm - 3
:00 pm","tuesday":"1:00 pm - 2:00 pm","wednesday":"2:00 pm - 3:00 pm","thursday
":"2:00 pm - 3:00 pm","friday":"1:00 pm - 2:00 pm","saturday":"1:00 pm - 2:00 pm"},
{"course_id":4,"title":"Flutter","sunday":"1:00 pm - 2:00 pm","monday":"1:00 pm
- 2:00 pm","tuesday":"No Classes","wednesday":"1:00 pm - 2:00 pm","thursday":"2:
00 pm - 2:30 pm","friday":"2:00 pm - 3:00 pm","saturday":"No classes"},
{"course_id":6,"title":"Python","sunday":"1:00 pm - 2:00 pm","monday":"1:00 pm
- 2:00 pm","tuesday":"1:15 pm - 2:00 pm","wednesday":"2:00 pm - 3:00 pm","thursday":
"1:00 pm - 2:00 pm","friday":"2:00 pm - 3:00 pm","saturday":"No Classes"},
{"course_id":5,"title":"Java","sunday":"1:00 pm - 2:00 pm","monday":"2:00 pm - 2
:50 pm","tuesday":"1:00 pm - 2:00 pm","wednesday":"2:00 pm - 3:00 pm","thursda
y":"2:00 pm - 2:30 pm","friday":"1:00 pm - 2:00 pm","saturday":"No Classes"}]
        ''', 200));
    expect(await apiRepositoryInterface.getSchedules(), isA<List<Schedule>>());
  });
}
