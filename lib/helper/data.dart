import '../models/category_model.dart';
List< CategoryModel> getCategory()
{
    List<CategoryModel> myCategory = List<CategoryModel>();

    //1
    CategoryModel categoryModel = new CategoryModel()
    ..catName = "Business"
    ..imgUrl = "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
    myCategory.add(categoryModel);
   //2
   categoryModel = new CategoryModel()
   ..catName = "Entertainment"
   ..imgUrl = "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
    myCategory.add(categoryModel);
    // //3
    // categoryModel = new CategoryModel()
    // ..catName = "General"
    // ..imgUrl ="https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
    // myCategory.add(categoryModel);
    //4
    categoryModel = new CategoryModel()
    ..catName = "Health"
    ..imgUrl = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
    myCategory.add(categoryModel);
    //5
    categoryModel = new CategoryModel()
    ..catName = "Science"
    ..imgUrl = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
    myCategory.add(categoryModel);

    return myCategory;
}

