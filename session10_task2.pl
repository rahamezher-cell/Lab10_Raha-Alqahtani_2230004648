% Sample user dataset
user_account(ali, pass123).
user_account(sara, abc123).
user_account(raha, cs401).

% Start the login process
login :-
    login_attempts(3).

% Ask for credentials
login_attempts(AttemptsLeft) :-
    write('Enter username: '),
    read(Username),

    write('Enter password: '),
    read(Password),

    ( user_account(Username, Password)
    -> writeln('Login Successful')
    ;  writeln('Login Unsuccessful'),
       Remaining is AttemptsLeft - 1,
       ( Remaining > 0
       -> login_attempts(Remaining)
       ;  writeln('Sorry, you exceeded the maximum number of attempts, try again later.')
       )
    ).
