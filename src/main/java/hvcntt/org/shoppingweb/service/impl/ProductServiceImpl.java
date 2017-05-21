
package hvcntt.org.shoppingweb.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import hvcntt.org.shoppingweb.dao.dto.ProductDto;
import hvcntt.org.shoppingweb.dao.entity.Category;
import hvcntt.org.shoppingweb.dao.entity.Image;
import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.dao.entity.Supplier;
import hvcntt.org.shoppingweb.dao.entity.TransactionType;
import hvcntt.org.shoppingweb.dao.repository.*;
import hvcntt.org.shoppingweb.exception.ProductNotFoundException;
import hvcntt.org.shoppingweb.service.ProductService;
import hvcntt.org.shoppingweb.utils.CommonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Service
public class ProductServiceImpl implements ProductService {

    private static final int PAGE_SIZE = 8;

    @Value("${UPLOAD_DIR_TARGET}")
    private String UPLOAD_DIR_TARGET;

    @Value("${UPLOAD_DIR_SRC}")
    private String UPLOAD_DIR_SRC;

    private static final String FORMAT_DATE_TO_STRING = "yyyyMMdd";

    private static char[] SPECIAL_CHARACTERS = { ' ', '!', '"', '#', '$', '%',
            '*', '+', ',', ':', '<', '=', '>', '?', '@', '[', '\\', ']', '^',
            '`', '|', '~', 'À', 'Á', 'Â', 'Ã', 'È', 'É', 'Ê', 'Ì', 'Í', 'Ò',
            'Ó', 'Ô', 'Õ', 'Ù', 'Ú', 'Ý', 'à', 'á', 'â', 'ã', 'è', 'é', 'ê',
            'ì', 'í', 'ò', 'ó', 'ô', 'õ', 'ù', 'ú', 'ý', 'Ă', 'ă', 'Đ', 'đ',
            'Ĩ', 'ĩ', 'Ũ', 'ũ', 'Ơ', 'ơ', 'Ư', 'ư', 'Ạ', 'ạ', 'Ả', 'ả', 'Ấ',
            'ấ', 'Ầ', 'ầ', 'Ẩ', 'ẩ', 'Ẫ', 'ẫ', 'Ậ', 'ậ', 'Ắ', 'ắ', 'Ằ', 'ằ',
            'Ẳ', 'ẳ', 'Ẵ', 'ẵ', 'Ặ', 'ặ', 'Ẹ', 'ẹ', 'Ẻ', 'ẻ', 'Ẽ', 'ẽ', 'Ế',
            'ế', 'Ề', 'ề', 'Ể', 'ể', 'Ễ', 'ễ', 'Ệ', 'ệ', 'Ỉ', 'ỉ', 'Ị', 'ị',
            'Ọ', 'ọ', 'Ỏ', 'ỏ', 'Ố', 'ố', 'Ồ', 'ồ', 'Ổ', 'ổ', 'Ỗ', 'ỗ', 'Ộ',
            'ộ', 'Ớ', 'ớ', 'Ờ', 'ờ', 'Ở', 'ở', 'Ỡ', 'ỡ', 'Ợ', 'ợ', 'Ụ', 'ụ',
            'Ủ', 'ủ', 'Ứ', 'ứ', 'Ừ', 'ừ', 'Ử', 'ử', 'Ữ', 'ữ', 'Ự', 'ự', };

    private static char[] REPLACEMENTS = { '-', '\0', '\0', '\0', '\0', '\0',
            '\0', '_', '\0', '_', '\0', '\0', '\0', '\0', '\0', '\0', '_',
            '\0', '\0', '\0', '\0', '\0', 'A', 'A', 'A', 'A', 'E', 'E', 'E',
            'I', 'I', 'O', 'O', 'O', 'O', 'U', 'U', 'Y', 'a', 'a', 'a', 'a',
            'e', 'e', 'e', 'i', 'i', 'o', 'o', 'o', 'o', 'u', 'u', 'y', 'A',
            'a', 'D', 'd', 'I', 'i', 'U', 'u', 'O', 'o', 'U', 'u', 'A', 'a',
            'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A',
            'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'E', 'e', 'E', 'e',
            'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'I',
            'i', 'I', 'i', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o',
            'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O',
            'o', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u',
            'U', 'u', };
    private final String CHARACTER_CONNECT = "_";

    @Autowired
    HttpServletRequest request;

    @Autowired
    ImageRepository imageRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    TransactionTypeRepository transactionTypeRepository;

    @Autowired
    SupplierRepository supplierRepository;

    @Autowired
    CategoryRepository categoryRepository;

    @Override
    public List<Product> getAll() {
        return productRepository.findAll();
    }

    @Override
    public Product findOne(String productId) {
        return productRepository.findOne(productId);
    }

    @Override
    public List<Product> findByNameContaining(String name) {
        return productRepository.findByNameContaining(name);
    }

    @Override
    public void updateView(String productId) {
        productRepository.updateView(productId);
    }

    @Override
    public List<Product> findByProductTransactionType(TransactionType transactionType) {
        return productRepository.findByTransactionType(transactionType, new PageRequest(0, 12)).getContent();
    }

    @Override
    public List<Product> findByCategoryAndPrice(Category category, float minPrice, float maxPrice) {
        return productRepository.findByCategoryAndPriceBetween(category, minPrice, maxPrice);
    }

    @Override
    public List<Product> findByCategoryAndPriceBetweenAndProductIdNotIn(Category category, float minPrice,
                                                                        float maxPrice, String productId) {
        return productRepository.findByCategoryAndPriceBetweenAndProductIdNotIn(category, minPrice, maxPrice, productId);
    }

    @Override
    public Page<Product> getProductPaging(int pageNumber) {
        PageRequest request = new PageRequest(pageNumber - 1, PAGE_SIZE);
        return productRepository.findAll(request);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public void deleteProduct(String productId) throws ProductNotFoundException {
        if (productRepository.getOne(productId) != null) {
            productRepository.delete(productId);
        } else {
            throw new ProductNotFoundException("Product not found with Id : " + productId);
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public void save(ProductDto productDto) throws Exception {
        Product product = new Product();
        product.setCategory(categoryRepository.getOne(productDto.getCategoryId()));
        product.setDescription(productDto.getDescription());
        product.setCreateDate(new Date());
        product.setManufactureDate(formatStringToDate(productDto.getManufactureDate()));
        product.setPrice(productDto.getPrice());
        product.setStockQuantity(productDto.getStockQuantity());
        product.setSupplier(supplierRepository.getOne(productDto.getSupplierId()));
        product.setTransactionType(transactionTypeRepository.getOne(productDto.getTransactionTypeId()));
        product.setName(productDto.getName());
        List<MultipartFile> multipartFiles = getMultipartFiles(productDto);
        List<Image> images = getImageUrlFromMultiFile(multipartFiles, product);
        product.setImageUrl(images.get(0).getImageUrl());
        product.setImages(images);
        productRepository.save(product);
        imageRepository.save(images);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public void update(ProductDto productDto, String productId) throws Exception {
        Product product = productRepository.findOne(productId);
        product.setCategory(categoryRepository.getOne(productDto.getCategoryId()));
        String description = productDto.getDescription();
        if (!description.isEmpty()) {
            product.setDescription(description);
        }
        product.setCreateDate(new Date());
        product.setManufactureDate(formatStringToDate(productDto.getManufactureDate()));
        product.setPrice(productDto.getPrice());
        product.setStockQuantity(productDto.getStockQuantity());
        product.setSupplier(supplierRepository.getOne(productDto.getSupplierId()));
        product.setTransactionType(transactionTypeRepository.getOne(productDto.getTransactionTypeId()));
        product.setName(productDto.getName());
        List<MultipartFile> multipartFiles = getMultipartFiles(productDto);
        if (!multipartFiles.isEmpty() && multipartFiles.size() > 0) {
            List<Image> images = getImageUrlFromMultiFile(multipartFiles, product);
            if (!images.isEmpty()) {
                List<Image> imagesByProduct = imageRepository.findByProduct(product);
                if (!imagesByProduct.isEmpty()) {
                    for (Image image : imagesByProduct) {
                        imageRepository.delete(image);
                    }
                }
                product.setImages(images);
                product.setImageUrl(images.get(0).getImageUrl());
                productRepository.save(product);
                imageRepository.save(images);
            } else {
                productRepository.save(product);
            }

        } else {
            productRepository.save(product);
        }
    }

    private List<MultipartFile> getMultipartFiles(ProductDto productDto) {
        List<MultipartFile> multipartFiles = new ArrayList<>();
        multipartFiles.add(productDto.getImage1());
        multipartFiles.add(productDto.getImage2());
        multipartFiles.add(productDto.getImage3());
        return multipartFiles;
    }

    private Date formatStringToDate(String date) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        return format.parse(date);
    }

    private List<Image> getImageUrlFromMultiFile(List<MultipartFile> multipartFiles, Product product) throws Exception {
        List<Image> images = new ArrayList<>();
        if (null != multipartFiles && multipartFiles.size() > 0) {
            int i = 1;
            for (MultipartFile multipartFile : multipartFiles) {
                String fileName = multipartFile.getOriginalFilename();
                String imageType = fileName.substring(fileName.indexOf(".") + 1);
                String imageName = toUrlFriendly(product.getName().trim()).concat(String.valueOf(i)).concat(CHARACTER_CONNECT).concat(CommonUtil.convertDateToString(product.getCreateDate(), FORMAT_DATE_TO_STRING)).concat(".").concat(imageType);
                if (!imageName.isEmpty()) {
                    Image image = new Image();
                    image.setImageUrl(imageName);
                    image.setImageTitle(product.getName() + " " + i);
                    image.setProduct(product);
                    images.add(image);
                }
                try {
                    String targetPathToUploads = request.getServletContext().getRealPath(UPLOAD_DIR_TARGET);
                    if (!new File(targetPathToUploads).exists()) {
                        new File(targetPathToUploads).mkdir();
                    }
                    String filePathTarget = targetPathToUploads + imageName;
                    String filePathSrc = UPLOAD_DIR_SRC + imageName;
                    File destTarget = new File(filePathTarget);
                    File destSrc = new File(filePathSrc);
                    multipartFile.transferTo(destTarget);
                    multipartFile.transferTo(destSrc);
                } catch (IOException e) {
                    throw new Exception("Can't save product");
                }
                i++;
            }
        }
        return images;
    }

    public static String toUrlFriendly(String s) {
        int maxLength = Math.min(s.length(), 236);
        char[] buffer = new char[maxLength];
        int n = 0;
        for (int i = 0; i < maxLength; i++) {
            char ch = s.charAt(i);
            buffer[n] = removeAccent(ch);
            if (buffer[n] > 31) {
                n++;
            }
        }
        while (n > 0 && buffer[n - 1] == '/') {
            n--;
        }
        return String.valueOf(buffer, 0, n);
    }

    public static char removeAccent(char ch) {
        int index = Arrays.binarySearch(SPECIAL_CHARACTERS, ch);
        if (index >= 0) {
            ch = REPLACEMENTS[index];
        }
        return ch;
    }

    public static String removeAccent(String s) {
        StringBuilder sb = new StringBuilder(s);
        for (int i = 0; i < sb.length(); i++) {
            sb.setCharAt(i, removeAccent(sb.charAt(i)));
        }
        return sb.toString();
    }

    @Override
    public Page<Product> findProductPaging(TransactionType transactionType, Pageable pageable) {
        return productRepository.findByTransactionType(transactionType, pageable);
    }

    @Override
    public List<Product> findByTransactionType(TransactionType transactionType) {
        return productRepository.findByTransactionType(transactionType);
    }

    @Override
    public List<Product> findByIds(List<String> productIds) {
        List<Product> products = new ArrayList<>();
        for (String productId : productIds) {
            Product product = productRepository.findOne(productId);
            products.add(product);
        }
        return products;
    }

    @Override
    public List<Product> findBySupplier(Supplier supplier) {
        return productRepository.findBySupplier(supplier);
    }

    @Override
    public List<Product> findByTransactionType(TransactionType transactionType, Sort sort) {
        return productRepository.findByTransactionType(transactionType, sort);
    }

    @Override
    public List<Product> findByTransactionType(List<Product> products, TransactionType transactionType, Sort sort) {
        return productRepository.findByTransactionType(products, transactionType, sort);
    }

    @Override
    public List<Product> findByCategory(String categoryId) {
        Category category = categoryRepository.findOne(categoryId);
        return productRepository.findByCategory(category);
    }

    @Override
    public List<Product> findByContainingnameAndDescPrice(String name) {
        return productRepository.findByNameContainingOrderByPriceDesc(name);
    }

    @Override
    public List<Product> findByContainingnameAndAscPrice(String name) {
        return productRepository.findByNameContainingOrderByPriceAsc(name);
    }

    @Override
    public void save(Product product) {
        productRepository.save(product);
    }

    @Override
    public Product findByName(String name) {
        return productRepository.findByName(name);
    }

	@Override
	public List<Product> getNewProduct() {
		return productRepository.findAll(new PageRequest(0, 8, Direction.DESC, "createDate")).getContent();
	}


}