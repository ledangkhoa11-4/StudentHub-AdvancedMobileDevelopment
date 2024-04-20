import 'package:boilerplate/core/data/local/sembast/sembast_client.dart';
import 'package:boilerplate/data/local/constants/db_constants.dart';
import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:boilerplate/domain/entity/project/project_list.dart';
import 'package:sembast/sembast.dart';

class ProjectDataSource {
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Project objects converted to Map
  final _projectsStore = intMapStoreFactory.store(DBConstants.STORE_NAME);

  // database instance
  final SembastClient _sembastClient;

  // Constructor
  ProjectDataSource(this._sembastClient);

  // DB functions:--------------------------------------------------------------
  Future<int> insert(Project project) async {
    return await _projectsStore.add(_sembastClient.database, project.toMap());
  }

  Future<int> count() async {
    return await _projectsStore.count(_sembastClient.database);
  }

  Future<List<Project>> getAllSortedByFilter({List<Filter>? filters}) async {
    //creating finder
    final finder = Finder(
        filter: filters != null ? Filter.and(filters) : null,
        sortOrders: [SortOrder(DBConstants.FIELD_ID)]);

    final recordSnapshots = await _projectsStore.find(
      _sembastClient.database,
      finder: finder,
    );

    // Making a List<Project> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final project = Project.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      project.id = snapshot.key;
      return project;
    }).toList();
  }

  Future<ProjectList> getProjectsFromDb() async {
    print('Loading from database');

    // project list
    var projectsList;

    // fetching data
    final recordSnapshots = await _projectsStore.find(
      _sembastClient.database,
    );

    // Making a List<Project> out of List<RecordSnapshot>
    if (recordSnapshots.length > 0) {
      projectsList = ProjectList(
          projects: recordSnapshots.map((snapshot) {
        final project = Project.fromMap(snapshot.value);
        // An ID is a key of a record from the database.
        project.id = snapshot.key;
        return project;
      }).toList());
    }

    return projectsList;
  }

  Future<int> update(Project project) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(project.id));
    return await _projectsStore.update(
      _sembastClient.database,
      project.toMap(),
      finder: finder,
    );
  }

  Future<int> delete(Project project) async {
    final finder = Finder(filter: Filter.byKey(project.id));
    return await _projectsStore.delete(
      _sembastClient.database,
      finder: finder,
    );
  }

  Future deleteAll() async {
    await _projectsStore.drop(
      _sembastClient.database,
    );
  }
}
