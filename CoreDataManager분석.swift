import CoreData

final class CoreDataManager {
    //final 키워드를 사용하여 상속을 못하게 함
    static let shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        //NSPersistentContainer를 사용하여 CoreData 스택을 설정
        //스택을 가져오기 위한 lazy var를 선언
        let persistentContainer = NSPersistentContainer(name: "SecureMarshmallow")
        //persistentContainer에는 "SecureMarshmallow" CoreData 모델이 로드
        persistentContainer.loadPersistentStores { _, error in
            print(error?.localizedDescription ?? "")
        }
        return persistentContainer
        //에러 메시지를 출력, persistentContainer를 반환
    }()
    
        var managedObjectContext: NSManagedObjectContext {
        //NSManagedObjectContext를 반환하는 계산된 속성을 정의
        persistentContainer.viewContext
        //이 계산된 속성은 persistentContainer의 viewContext를 반환
    }
    
    func saveTask(title: String, details: String?) {
        let task = Task(context: managedObjectContext)
        //Task 엔티티를 생성
        task.setValue(title, forKey: "title")
        task.setValue(details, forKey: "details")
        //title과 details 속성에 값을 설정
        do {
            try managedObjectContext.save()
        } catch {
            print(error)
        }
    }
    
    func fetchTasks() -> [Task] {
        do {
            let fetchRequest = NSFetchRequest<Task>(entityName: "Task")
            let tasks = try managedObjectContext.fetch(fetchRequest)
            return tasks
            //Task 엔티티에서 모든 객체를 가져와서 반환
        } catch {
            print(error)
            return []
            //객체를 가져오지 못하면 빈 배열을 반환
        }
    }
}
