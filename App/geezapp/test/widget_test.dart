import 'package:flutter_test/flutter_test.dart';
import 'package:geezapp/login/bloc/bloc.dart';

import 'package:mockito/mockito.dart';
import 'package:geezapp/Auth/auth.dart';
import 'package:geezapp/login/repository/repository.dart';
import 'package:geezapp/login/login.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockAuthenticationBloc extends Mock implements AuthenticationBloc {}

void main() {
  LoginBloc? loginBloc;
  MockUserRepository? userRepository;
  MockAuthenticationBloc? authenticationBloc;

  setUp(() {
    userRepository = MockUserRepository();
    authenticationBloc = MockAuthenticationBloc();
    loginBloc = LoginBloc(
      userRepository: userRepository!,
      authenticationBloc: authenticationBloc!,
    );
  });

  tearDown(() {
    loginBloc!.close();
    authenticationBloc!.close();
  });

  test('initial state is correct', () {
    expect(LoginInitial(), loginBloc!.initialState);
  });

  test('close does not emit new states', () {
    expectLater(
      loginBloc,
      emitsInOrder([LoginInitial(), emitsDone]),
    );
    loginBloc!.close();
  });

  group('LoginButtonPressed', () {
    test('emits token on success', () {
      final expectedResponse = [
        LoginInitial(),
        LoginLoading(),
        LoginInitial(),
      ];

      when(userRepository!.login(
        'mmm@',
       '123',
      )).thenAnswer((_) => Future.value('user_id'));

      expectLater(
        loginBloc,
        emitsInOrder(expectedResponse),
      ).then((_) {
        verify(authenticationBloc!.add(LoggedIn(token: 'user_id'))).called(1);
      });

      loginBloc!.add(LoginButtonPressed(
        email: '@mmm',
        password: '123',
      ));
    });
  });
}