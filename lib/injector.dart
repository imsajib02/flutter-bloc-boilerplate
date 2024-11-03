import '/core/network/connectivity_status.dart';
import '/core/network/interceptor_barrel.dart';
import '/core/network/network_client.dart';
import '/domain/repositories/repository_barrel.dart';
import '/domain/usecases/use_case_barrel.dart';
import '/core/storage/hive_storage_manager.dart';
import '/core/utils/error_parser.dart';
import 'data/datasources/remote/todos/todos_remote_data_source.dart';
import 'data/datasources/remote/todos/todos_remote_data_source_impl.dart';
import 'data/repositories/todos/todos_repository_impl.dart';

final injector = DependencyInjector.instance;

class DependencyInjector {

  static DependencyInjector? _instance;

  static DependencyInjector get instance {
    _instance ??= DependencyInjector._init();
    return _instance!;
  }

  late final HiveStorageManager _hiveStorageManager;
  HiveStorageManager get storageManager => _hiveStorageManager;

  late final AcceptTypeInterceptor _acceptTypeInterceptor;
  late final ContentTypeInterceptor _contentTypeInterceptor;
  late final LoggerInterceptor _loggerInterceptor;
  late final ResponseInterceptor _responseInterceptor;
  late final AuthorizationInterceptor _authorizationInterceptor;

  late final ConnectivityStatus _connectivityStatus;
  late final ApiResponseError _errorParser;
  ApiResponseError get errorParser => _errorParser;

  late final TodosRemoteDataSource _todosRemoteDataSource;

  late final TodosRepository _todosRepository;

  late final TodosUseCase _todosUseCase;
  TodosUseCase get todosUseCase => _todosUseCase;

  DependencyInjector._init() {
    _initStorage();
    _initInterceptors();
    _initNetwork();
    _initRemoteDataSources();
    _initRepositories();
    _initUseCases();
  }

  // Local Storage
  void _initStorage() {
    _hiveStorageManager = HiveStorageManager();
  }

  // Network Interceptors
  void _initInterceptors() {
    _acceptTypeInterceptor = AcceptTypeInterceptor();
    _contentTypeInterceptor = ContentTypeInterceptor();
    _loggerInterceptor = LoggerInterceptor();
    _responseInterceptor = ResponseInterceptor();
    _authorizationInterceptor = AuthorizationInterceptor(_hiveStorageManager);
  }

  // Network
  void _initNetwork() {
    _connectivityStatus = ConnectivityStatus();
    _errorParser = ApiResponseError();
  }

  // Data Sources
  void _initRemoteDataSources() {
    _todosRemoteDataSource = TodosRemoteDataSourceImpl(NetworkClient(_connectivityStatus, [_acceptTypeInterceptor, _loggerInterceptor]));
  }

  // Repositories
  void _initRepositories() {
    _todosRepository = TodosRepositoryImpl(_todosRemoteDataSource);
  }

  // Use cases
  void _initUseCases() {
    _todosUseCase = TodosUseCase(_todosRepository);
  }
}