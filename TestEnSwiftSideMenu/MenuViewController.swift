import UIKit

class MenuViewController: UITableViewController,HeaderTableViewProtocol {
//    var collapsibleSection = Set<MenuItem>()
    var sections  = [SectionMenu]()
    var seccion1 = [MenuItem]()
    var seccion2 = [MenuItem]()
    var configSection = [MenuItem]()
    var headerView : MenuHeaderView?
    
    var mainViewController: UIViewController!
    var swiftViewController: UIViewController!

    override func viewDidLoad() {
        seccion1 = [MenuItem(title: "Mi Perfil", imageName: "user"),
            MenuItem(title:"Recompensas", imageName: "recompensa"),
            MenuItem(title:"Recomendaciones", imageName: "recomendaciones"),
        ]
        seccion2 = [ MenuItem(title:"Inicio", imageName: "home"),
            MenuItem(title:"Explorar", imageName: "explorar"),
            MenuItem(title:"Trendy", imageName: "trendy"),
            MenuItem(title:"Evento", imageName: "eventos"),
            MenuItem(title:"Cupones", imageName: "cupones"),
            MenuItem(title:"Guía", imageName: "guia")]
        
        configSection = [MenuItem(title:"Editar Perfil", imageName: "editar"),
            MenuItem(title:"Configuración", imageName: "configuracion"),
            MenuItem(title:"Información", imageName: "info"),
            MenuItem(title:"Salir", imageName: "salir")]
        
        
//        self.sections = [SectionMenu(title: "configuracion", items: self.configSection),
//            SectionMenu(title: "seccion1", items: self.seccion1),
//            SectionMenu(title: "seccion2", items: self.seccion2)]
        self.sections = [SectionMenu(title:"seccion1",items: self.seccion1),
            SectionMenu(title:"seccion2", items: self.seccion2)]
        
        
        self.headerView  = MenuHeaderView(frame: CGRect(x: 0.0, y: 0.0, width: 380, height: 130))
        self.headerView?.delegate = self
        self.tableView.tableHeaderView = headerView
        
        
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1;
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //        return self.sections[section].sectionTitle
        return ""
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].items!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let menuItem = self.sections[indexPath.section].items![indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        let section:SectionMenu = self.sections[indexPath.section]
        if section.sectionTitle == "settings" {
            cell.backgroundColor =  UtilFunctions.UIColorFromRGB(0xF5F5F5)
        }
        
        cell.imageView?.image = menuItem.image
        cell.textLabel?.text = menuItem.title
        return cell
    }
    
    //MARK: Metodos delegados de HeaderTableViewProtocol
    
    func expandConfigSection(isExpanded:Bool){
        if(isExpanded){
            self.tableView.beginUpdates()
            self.sections.insert(SectionMenu(title: "settings", items: self.configSection),atIndex: 0)
            self.tableView.insertSections(NSIndexSet(index: 0), withRowAnimation: .Fade)
            self.tableView.endUpdates()
        }else{
            self.tableView.beginUpdates()
            self.sections.removeAtIndex(0);
            self.tableView.deleteSections(NSIndexSet(index: 0), withRowAnimation: .Fade)
            self.tableView.endUpdates()
        }
    }
}

class SectionMenu : NSObject{
    var sectionTitle : String?
    var items : [MenuItem]?
    init (title: String,items: [MenuItem]){
        super.init()
        
        self.sectionTitle = title
        self.items = items
    }
}


class MenuItem : NSObject{
    
    var image : UIImage?
    var title : String?
    var imageName: String?
    
    init (title : String, imageName: String){
        super.init()
        self.title = title
        self.imageName = imageName
//        self.image = UIImage(named: self.imageName!)!
    }
    
}