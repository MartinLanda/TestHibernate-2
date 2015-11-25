import model.Article;
import model.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * Created by Camunda on 11/23/2015.
 */
public class CategoryManager {

    public static void main(String[] args){
        // loads configuration and mappings
        Configuration configuration = new Configuration().configure();
        ServiceRegistryBuilder registry = new ServiceRegistryBuilder();
        registry.applySettings(configuration.getProperties());
        ServiceRegistry serviceRegistry = registry.buildServiceRegistry();

        // builds a session factory from the service registry
        SessionFactory sessionFactory = configuration
                .buildSessionFactory(serviceRegistry);
        // obtains the session
        Session session = sessionFactory.openSession();
        session.beginTransaction();

//        List<Category> categories = session.createQuery("FROM Category ").list();
//
//        for (Iterator iterator = categories.iterator(); iterator.hasNext();){
//            Category category = (Category) iterator.next();
//            System.out.print(category.getId()+" - Category name: " + category.getName());
//            session.delete(category);
//        }

        Set<Article> articles = new HashSet<Article>();
        List<Article> savedArticles = session.createQuery("FROM Article ").list();
        for (Iterator iterator = savedArticles.iterator(); iterator.hasNext();){
            Article article = (Article) iterator.next();
            System.out.print(article.getId() + " - Article description: " + article.getDescription());
            articles.add(article);
        }

        Category category = new Category("Hibernate Framework");
        category.setArticles(articles);
        session.save(category);

        session.getTransaction().commit();
        session.close();
    }
}
