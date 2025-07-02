BLoC flow for Task 1


A[UI] -- FetchUsers --> B[UserBloc]
B -->|emit UserLoading| C((StateStream))
B -->|dbService.getUsers()| D[SQLite]
D --> E{users?}
E -- yes --> F[emit UserLoaded]
E -- no --> B2[apiService.fetchUsers()]
B2 --> D2[dbService.insertUsers()]
D2 --> F

The UI dispatches `FetchUsers` on first load and on manual refresh.
The BLoC first looks in SQLite; if empty, it fetches from the API and caches.
**Search** dispatches `SearchUsers` which queries SQLite with a `LIKE` clause.

Local Notification Flow Task 2
1. `NotificationService.init()` registers the channel and requests permission.
2. Pressing **Send Notification** calls `NotificationService.show()` which: Uses `AndroidNotificationDetails` with a custom colour, ticker, vibration pattern and **BigTextStyle** for tray UI.
