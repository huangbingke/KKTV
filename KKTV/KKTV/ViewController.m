//
//  ViewController.m
//  KKTV
//
//  Created by KK on 2020/12/7.
//

#import "ViewController.h"
#import "KKLeftCell.h"
#import "KKRightCell.h"
#import "KKPlayViewController.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray <KKModel *>*dataArray;
@property (nonatomic, assign) NSInteger index;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerNib:[UINib nibWithNibName:@"KKLeftCell" bundle:nil] forCellReuseIdentifier:@"KKLeftCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"KKRightCell" bundle:nil] forCellWithReuseIdentifier:@"KKRightCell"];
    self.tableView.tableFooterView = [UIView new];
    
    [self.tableView reloadData];
    [self.collectionView reloadData];
    
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    
}




#pragma mark - UITableViewDelegate, UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KKLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KKLeftCell" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    KKModel *model = self.dataArray[indexPath.row];
    model.isSelect = !model.isSelect;

    if (self.index != -1) {
        KKModel *lastModel = self.dataArray[self.index];
        lastModel.isSelect = !lastModel.isSelect;
    }
    
    self.index = indexPath.row;
    [tableView reloadData];
    [self.collectionView reloadData];
}


#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource -
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    KKModel *model = self.dataArray[self.index];
    return model.tvs.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    KKModel *model = self.dataArray[self.index];
    KKRightCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"KKRightCell" forIndexPath:indexPath];
    cell.model = model.tvs[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    KKModel *model = self.dataArray[self.index];

    KKPlayViewController *vc = [[KKPlayViewController alloc] init];
    vc.url = model.tvs[indexPath.row].url;
    [self presentViewController:vc animated:YES completion:nil];
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((kWidth-180-20*4)/3, 80);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(20, 20, 20, 20);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 20;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 20;
}


#pragma mark - Getter -
- (NSMutableArray<KKModel *> *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
        KKTVModel *model1 = [[KKTVModel alloc] initWithName:@"CCTV-1 综合" url:@"http://183.207.248.71:80/cntv/live1/HD-8000k-1080P-cctv1/HD-8000k-1080P-cctv1"];
        KKTVModel *model2 = [[KKTVModel alloc] initWithName:@"CCTV-2 财经" url:@"http://183.207.248.71:80/cntv/live1/HD-8000k-1080P-cctv2/HD-8000k-1080P-cctv2"];
        KKTVModel *model3 = [[KKTVModel alloc] initWithName:@"CCTV-3 综艺" url:@"http://183.207.248.71:80/cntv/live1/HD-8000k-1080P-cctv3/HD-8000k-1080P-cctv3"];
        KKTVModel *model4 = [[KKTVModel alloc] initWithName:@"CCTV-4 中文国际" url:@"http://183.207.248.71:80/cntv/live1/cctv-4/cctv-4"];
        KKTVModel *model5 = [[KKTVModel alloc] initWithName:@"CCTV-5 体育"  url:@"http://183.207.248.71:80/cntv/live1/HD-8000k-1080P-cctv5/HD-8000k-1080P-cctv5"];
        KKTVModel *model5j = [[KKTVModel alloc] initWithName:@"CCTV-5+ 体育赛事" url:@"http://183.207.248.71:80/cntv/live1/HD-8000k-1080P-cctv05plus/HD-8000k-1080P-cctv05plus"];
        KKTVModel *model6 = [[KKTVModel alloc] initWithName:@"CCTV-6 电影" url:@"http://183.207.248.71:80/cntv/live1/cctv-6/cctv-6"];
        KKTVModel *model7 = [[KKTVModel alloc] initWithName:@"CCTV-7 军事农业" url:@"http://183.207.248.71:80/cntv/live1/HD-8000k-1080P-cctv7/HD-8000k-1080P-cctv7"];
        KKTVModel *model8 = [[KKTVModel alloc] initWithName:@"CCTV-8 电视剧" url:@"http://183.207.248.71:80/cntv/live1/HD-8000k-1080P-cctv8/HD-8000k-1080P-cctv8"];
        KKTVModel *model9 = [[KKTVModel alloc] initWithName:@"CCTV-9 记录" url:@"http://183.207.248.71:80/cntv/live1/HD-8000k-1080P-cctv9/HD-8000k-1080P-cctv9"];
        KKTVModel *model10 = [[KKTVModel alloc] initWithName:@"CCTV-10 科教" url:@"http://183.207.248.71:80/cntv/live1/HD-8000k-1080P-cctv10/HD-8000k-1080P-cctv10"];
        KKTVModel *model11 = [[KKTVModel alloc] initWithName:@"CCTV-11 戏曲" url:@"http://183.207.248.71:80/cntv/live1/n-cctv-11/n-cctv-11"];
        KKTVModel *model12 = [[KKTVModel alloc] initWithName:@"CCTV-12 社会与法" url:@"http://183.207.248.71:80/cntv/live1/HD-8000k-1080P-cctv12/HD-8000k-1080P-cctv12"];
        KKTVModel *model13 = [[KKTVModel alloc] initWithName:@"CCTV-13 新闻" url:@"http://183.207.248.71:80/cntv/live1/cctv-13/cctv-13"];
        KKTVModel *model14 = [[KKTVModel alloc] initWithName:@"CCTV-14 少儿" url:@"http://183.207.248.71:80/cntv/live1/HD-8000k-1080P-cctv14/HD-8000k-1080P-cctv14"];
        KKTVModel *model15 = [[KKTVModel alloc] initWithName:@"CCTV-15 音乐" url:@"http://183.207.248.71:80/cntv/live1/n-cctv-15/n-cctv-15"];
        KKTVModel *model17 = [[KKTVModel alloc] initWithName:@"CCTV-17 农业农村" url:@"http://183.207.248.71:80/cntv/live1/HD-8000k-1080P-cctv17/HD-8000k-1080P-cctv17"];
        NSArray *yangshiArr = @[model1, model2, model3, model4, model5, model5j, model6, model7, model8, model9, model10, model11, model12, model13, model14, model15, model17];
        KKModel *yangshiModel = [[KKModel alloc] initWithTitle:@"央视" tvs:yangshiArr];
        yangshiModel.isSelect = YES;
        
        
        
        KKTVModel *bjModel = [[KKTVModel alloc] initWithName:@"北京卫视" url:@"http://183.207.248.71:80/cntv/live1/HD-2500k-1080P-beijingstv/HD-2500k-1080P-beijingstv"];
        KKTVModel *bjjsModel = [[KKTVModel alloc] initWithName:@"北京纪实" url:@"http://183.207.248.71:80/cntv/live1/HD-8000k-1080P-beijingjishi/HD-8000k-1080P-beijingjishi"];
        KKTVModel *hunanModel = [[KKTVModel alloc] initWithName:@"湖南卫视" url:@"http://183.207.248.71:80/cntv/live1/hunanstv/hunanstv"];
        KKTVModel *jiangsuModel = [[KKTVModel alloc] initWithName:@"江苏卫视" url:@"http://183.207.248.71:80/cntv/live1/HD-2500k-1080P-jiangsustv/HD-2500k-1080P-jiangsustv"];
        KKTVModel *zhejiangModel = [[KKTVModel alloc] initWithName:@"浙江卫视" url:@"http://183.207.248.71:80/cntv/live1/zhejiangstv/zhejiangstv"];
        KKTVModel *dongfangModel = [[KKTVModel alloc] initWithName:@"东方卫视" url:@"http://183.207.248.71:80/cntv/live1/n-dongfangstv/n-dongfangstv"];
        KKTVModel *anhuiModel = [[KKTVModel alloc] initWithName:@"安徽卫视" url:@"http://183.207.248.71:80/cntv/live1/HD-8000k-1080P-anhuistv/HD-8000k-1080P-anhuistv"];
        KKTVModel *heilongjiangModel = [[KKTVModel alloc] initWithName:@"黑龙江卫视" url:@"http://183.207.248.71:80/cntv/live1/HD-8000k-1080P-heilongjiangstv/HD-8000k-1080P-heilongjiangstv"];
        KKTVModel *xiamenModel = [[KKTVModel alloc] initWithName:@"厦门卫视" url:@"http://183.207.248.71:80/cntv/live1/SD-4000k-576P-xiamenstv/SD-4000k-576P-xiamenstv"];
        KKTVModel *xinjiangModel = [[KKTVModel alloc] initWithName:@"新疆卫视" url:@"http://183.207.248.71:80/cntv/live1/n-xjtv1/n-xjtv1"];
        KKTVModel *qinghaiModel = [[KKTVModel alloc] initWithName:@"青海卫视" url:@"http://183.207.248.71:80/cntv/live1/n-qinghaistv/n-qinghaistv"];
        KKTVModel *shanxiModel = [[KKTVModel alloc] initWithName:@"山西卫视" url:@"http://183.207.248.71:80/cntv/live1/n-shanxistv/n-shanxistv"];
        KKTVModel *ningxiaModel = [[KKTVModel alloc] initWithName:@"宁夏卫视" url:@"http://183.207.248.71:80/cntv/live1/n-ningxiastv/n-ningxiastv"];
        KKTVModel *xizangModel = [[KKTVModel alloc] initWithName:@"西藏卫视" url:@"http://183.207.248.71:80/cntv/live1/n-xizangstv/n-xizangstv"];
        KKTVModel *shenzhenModel = [[KKTVModel alloc] initWithName:@"深圳卫视" url:@"http://183.207.248.71:80/cntv/live1/HD-2500k-1080P-shenzhenstv/HD-2500k-1080P-shenzhenstv"];
        KKTVModel *guangdongModel = [[KKTVModel alloc] initWithName:@"广东卫视" url:@"http://183.207.248.71:80/cntv/live1/n-guangdongstv/n-guangdongstv"];
        KKTVModel *tianjinModel = [[KKTVModel alloc] initWithName:@"天津卫视" url:@"http://183.207.248.71:80/cntv/live1/HD-2500k-1080P-tianjinstv/HD-2500k-1080P-tianjinstv"];
        KKTVModel *hubeiModel = [[KKTVModel alloc] initWithName:@"湖北卫视" url:@"http://183.207.248.71:80/cntv/live1/HD-2500k-1080P-hubeistv/HD-2500k-1080P-hubeistv"];
        KKTVModel *shandongModel = [[KKTVModel alloc] initWithName:@"山东卫视" url:@"http://183.207.248.71:80/cntv/live1/HD-2500k-1080P-shandongstv/HD-2500k-1080P-shandongstv"];
        KKTVModel *chongqingModel = [[KKTVModel alloc] initWithName:@"重庆卫视" url:@"http://183.207.248.71:80/cntv/live1/HD-8000k-1080P-chongqingstv/HD-8000k-1080P-chongqingstv"];
        KKTVModel *hebeiModel = [[KKTVModel alloc] initWithName:@"河北卫视" url:@"http://183.207.248.71:80/cntv/live1/n-hebeistv/n-hebeistv"];
        KKTVModel *sichuanModel = [[KKTVModel alloc] initWithName:@"四川卫视" url:@"http://183.207.248.71:80/cntv/live1/n-sichuanstv/n-sichuanstv"];
        KKTVModel *jiangxiModel = [[KKTVModel alloc] initWithName:@"江西卫视" url:@"http://183.207.248.71:80/cntv/live1/jiangxistv/jiangxistv"];
        KKTVModel *fujianModel = [[KKTVModel alloc] initWithName:@"福建东南卫视" url:@"http://183.207.248.71:80/cntv/live1/n-dongnanstv/n-dongnanstv"];
        KKTVModel *nanfangModel = [[KKTVModel alloc] initWithName:@"南方卫视" url:@"http://183.207.248.71:80/cntv/live1/SD-4000k-576P-nanfangstv/SD-4000k-576P-nanfangstv"];
        KKTVModel *yunnanModel = [[KKTVModel alloc] initWithName:@"云南卫视" url:@"http://183.207.248.71:80/cntv/live1/n-yntv1/n-yntv1"];
        KKTVModel *bingtuanModel = [[KKTVModel alloc] initWithName:@"兵团卫视" url:@"http://183.207.248.71:80/cntv/live1/SD-4000k-576P-bingtuanstv/SD-4000k-576P-bingtuanstv"];
        KKTVModel *neimengguModel = [[KKTVModel alloc] initWithName:@"内蒙古卫视" url:@"http://183.207.248.71:80/cntv/live1/n-neimenggustv/n-neimenggustv"];
        KKTVModel *nonglinModel = [[KKTVModel alloc] initWithName:@"农林卫视" url:@"http://183.207.248.71:80/cntv/live1/SD-4000k-576P-nonglinstv/SD-4000k-576P-nonglinstv"];
        KKTVModel *guangxiModel = [[KKTVModel alloc] initWithName:@"广西卫视" url:@"http://183.207.248.71:80/cntv/live1/n-guangxistv/n-guangxistv"];
        KKTVModel *kangbaModel = [[KKTVModel alloc] initWithName:@"康巴卫视" url:@"http://183.207.248.71:80/cntv/live1/SD-4000k-576P-kambatv/SD-4000k-576P-kambatv"];
        KKTVModel *yanbianModel = [[KKTVModel alloc] initWithName:@"延边卫视" url:@"http://183.207.248.71:80/cntv/live1/SD-4000k-576P-yanbianstv/SD-4000k-576P-yanbianstv"];
        KKTVModel *gansuModel = [[KKTVModel alloc] initWithName:@"甘肃卫视" url:@"http://183.207.248.71:80/cntv/live1/n-gansustv/n-gansustv"];
        KKTVModel *anduoModel = [[KKTVModel alloc] initWithName:@"安多卫视" url:@"http://183.207.248.71:80/cntv/live1/anduostv/anduostv"];
        KKTVModel *guizhouModel = [[KKTVModel alloc] initWithName:@"贵州卫视" url:@"http://183.207.248.71:80/cntv/live1/n-guizhoustv/n-guizhoustv"];
        KKTVModel *henanModel = [[KKTVModel alloc] initWithName:@"河南卫视" url:@"http://183.207.248.71:80/cntv/live1/henanstv/henanstv"];
        KKTVModel *liaoningModel = [[KKTVModel alloc] initWithName:@"辽宁卫视" url:@"http://183.207.248.71:80/cntv/live1/liaoningstv/liaoningstv"];
        KKTVModel *shanxi1Model = [[KKTVModel alloc] initWithName:@"陕西卫视" url:@"http://183.207.248.71:80/cntv/live1/n-shanxi1stv/n-shanxi1stv"];
        KKTVModel *shandongeduModel = [[KKTVModel alloc] initWithName:@"山东教育电视台" url:@"http://183.207.248.71:80/cntv/live1/n-shandongjy/n-shandongjy"];
        NSArray *weishiArr = @[bjModel, bjjsModel, hunanModel, jiangsuModel, heilongjiangModel, zhejiangModel, dongfangModel, anhuiModel, xizangModel, xiamenModel, xinjiangModel, qinghaiModel, shanxiModel, ningxiaModel, shenzhenModel, guangdongModel, tianjinModel, hubeiModel, shandongModel, chongqingModel, hebeiModel, sichuanModel, jiangxiModel, fujianModel, nanfangModel, yunnanModel, bingtuanModel, neimengguModel, nonglinModel, guangxiModel, kangbaModel, yanbianModel, gansuModel, anduoModel, guizhouModel, henanModel, liaoningModel, shanxi1Model, shandongeduModel];
        KKModel *weishiModel = [[KKModel alloc] initWithTitle:@"卫视" tvs:weishiArr];
        
        
        
        KKTVModel *cetv1Model = [[KKTVModel alloc] initWithName:@"CETV-1" url:@"http://183.207.248.71:80/cntv/live1/n-jiaoyutv/n-jiaoyutv"];
        KKTVModel *cetv2Model = [[KKTVModel alloc] initWithName:@"CETV-2" url:@"http://183.207.248.71:80/cntv/live1/SD-4000k-576P-jiaoyutv2/SD-4000k-576P-jiaoyutv2"];
        KKTVModel *cetv4Model = [[KKTVModel alloc] initWithName:@"CETV-4" url:@"http://183.207.248.71:80/cntv/live1/SD-4000k-576P-jiaoyutv4/SD-4000k-576P-jiaoyutv4"];
        KKTVModel *jishirenwenModel = [[KKTVModel alloc] initWithName:@"纪实人文" url:@"http://183.207.248.71:80/cntv/live1/HD-8000k-1080P-shanghaijishi/HD-8000k-1080P-shanghaijishi"];
        KKTVModel *jiankangyouyueModel = [[KKTVModel alloc] initWithName:@"健康有约" url:@"http://183.207.248.71:80/cntv/live1/n-ljiankangyouyue/n-ljiankangyouyue"];
        KKTVModel *chaomalapoModel = [[KKTVModel alloc] initWithName:@"潮妈辣婆" url:@"http://183.207.248.71:80/cntv/live1/n-cmlapo/n-cmlapo"];
        KKTVModel *xuanwuweilaiModel = [[KKTVModel alloc] initWithName:@"炫舞未来" url:@"http://183.207.248.71:80/cntv/live1/HD-4000k-1080P-xwwl/HD-4000k-1080P-xwwl"];
        KKTVModel *jingpinjiluModel = [[KKTVModel alloc] initWithName:@"精品纪录" url:@"http://183.207.248.71:80/cntv/live1/n-jingpinjl/n-jingpinjl"];

        KKTVModel *zhonghuameishiModel = [[KKTVModel alloc] initWithName:@"中华美食" url:@"http://183.207.248.71:80/cntv/live1/SD-4000k-576P-zhmeishi/SD-4000k-576P-zhmeishi"];
        KKTVModel *k4Model = [[KKTVModel alloc] initWithName:@"纯享4K" url:@"http://183.207.248.71:80/cntv/live1/HD-20M-2160P-chunxiang4k/HD-20M-2160P-chunxiang4k"];
        NSArray *otherArr = @[cetv1Model, cetv2Model, cetv4Model, jishirenwenModel, jiankangyouyueModel, chaomalapoModel, xuanwuweilaiModel, jingpinjiluModel, zhonghuameishiModel, k4Model];
        KKModel *otherModel = [[KKModel alloc] initWithTitle:@"其他" tvs:otherArr];
        
        
        
        KKTVModel *junshipinglunModel = [[KKTVModel alloc] initWithName:@"军事评论" url:@"http://183.207.248.71:80/cntv/live1/n-junshipl/n-junshipl"];
        KKTVModel *nongyezhifuModel = [[KKTVModel alloc] initWithName:@"农业致富" url:@"http://183.207.248.71:80/cntv/live1/n-nongyezf/n-nongyezf"];
        NSArray *junshinongyeArr = @[model4, model7, junshipinglunModel, nongyezhifuModel];
        KKModel *junshinongyeModel = [[KKModel alloc] initWithTitle:@"军事农业" tvs:junshinongyeArr];
        
        
        KKTVModel *heimei3Model = [[KKTVModel alloc] initWithName:@"黑莓动画" url:@"http://183.207.248.71:80/cntv/live1/donghuawg/donghuawg"];
        KKTVModel *kakuModel = [[KKTVModel alloc] initWithName:@"卡酷少儿" url:@"http://183.207.248.71:80/cntv/live1/n-kakukaton/n-kakukaton"];
        KKTVModel *jiajiaModel = [[KKTVModel alloc] initWithName:@"嘉佳卡通" url:@"http://183.207.248.71:80/cntv/live1/SD-4000k-576P-jiajiakaton/SD-4000k-576P-jiajiakaton"];
        KKTVModel *xuandongModel = [[KKTVModel alloc] initWithName:@"炫动卡通" url:@"http://183.207.248.71:80/cntv/live1/n-xuandongkaton/n-xuandongkaton"];
        KKTVModel *jinyingModel = [[KKTVModel alloc] initWithName:@"金鹰卡通" url:@"http://183.207.248.71:80/cntv/live1/n-jinyingkaton/n-jinyingkaton"];
        KKTVModel *youmanModel = [[KKTVModel alloc] initWithName:@"优漫卡通" url:@"http://183.207.248.71:80/cntv/live1/n-youmankaton/n-youmankaton"];
        NSArray *shaoerArr = @[model14, heimei3Model, kakuModel, jiajiaModel, xuandongModel, jinyingModel, youmanModel];
        KKModel *shaoerModel = [[KKModel alloc] initWithTitle:@"动画片" tvs:shaoerArr];

        
        KKTVModel *jinpaizongyiModel = [[KKTVModel alloc] initWithName:@"金牌综艺" url:@"http://183.207.248.71:80/cntv/live1/n-saishijx/n-saishijx"];
        KKTVModel *jingpinzongheModel = [[KKTVModel alloc] initWithName:@"精品综合" url:@"http://183.207.248.71:80/cntv/live1/n-mingxingdp/n-mingxingdp"];
        KKTVModel *shijiebojiModel = [[KKTVModel alloc] initWithName:@"世界搏击" url:@"http://183.207.248.71:80/cntv/live1/n-bokesen/n-bokesen"];
        KKTVModel *jingpintiyuModel = [[KKTVModel alloc] initWithName:@"精品体育" url:@"http://183.207.248.71:80/cntv/live1/n-jtiyu/n-jtiyu"];
        KKTVModel *chinakongfuModel = [[KKTVModel alloc] initWithName:@"中国功夫" url:@"http://183.207.248.71:80/cntv/live1/n-gzkongfu/n-gzkongfu"];
        KKTVModel *heimei1Model = [[KKTVModel alloc] initWithName:@"黑莓电竞之夜" url:@"http://183.207.248.71:80/cntv/live1/wmyx/wmyx"];
        NSArray *zongyiArr = @[model3, model5, model5j, jinpaizongyiModel, jingpinzongheModel, shijiebojiModel, jingpintiyuModel, chinakongfuModel, heimei1Model];
        KKModel *zongyisecModel = [[KKModel alloc] initWithTitle:@"综艺体育" tvs:zongyiArr];
        
        
        KKTVModel *dongzuodianyingModel = [[KKTVModel alloc] initWithName:@"动作电影" url:@"http://183.207.248.71:80/cntv/live1/n-dongzuody/n-dongzuody"];
        KKTVModel *jiatingjvchangModel = [[KKTVModel alloc] initWithName:@"家庭剧场" url:@"http://183.207.248.71:80/cntv/live1/n-jiatingjc/n-jiatingjc"];
        KKTVModel *jingsongdianyingModel = [[KKTVModel alloc] initWithName:@"惊悚电影" url:@"http://183.207.248.71:80/cntv/live1/n-jingsongxy/n-jingsongxy"];
        KKTVModel *jingpindajvModel = [[KKTVModel alloc] initWithName:@"精品大剧" url:@"http://183.207.248.71:80/cntv/live1/n-jdaju/n-jdaju"];
        KKTVModel *guzhuangModel = [[KKTVModel alloc] initWithName:@"古装剧场" url:@"http://183.207.248.71:80/cntv/live1/n-guzhuangjc/n-guzhuangjc"];
        KKTVModel *junlvjvchangModel = [[KKTVModel alloc] initWithName:@"军旅剧场" url:@"http://183.207.248.71:80/cntv/live1/n-junlvjc/n-junlvjc"];
        KKTVModel *rebojingxuanModel = [[KKTVModel alloc] initWithName:@"热播精选" url:@"http://183.207.248.71:80/cntv/live1/n-xiqumd/n-xiqumd"];
        KKTVModel *heimei2Model = [[KKTVModel alloc] initWithName:@"黑莓电影" url:@"http://183.207.248.71:80/cntv/live1/HD-8000k-1080P-Supermovie/HD-8000k-1080P-Supermovie"];
        KKTVModel *aiqingxijvModel = [[KKTVModel alloc] initWithName:@"爱情喜剧" url:@"http://183.207.248.71:80/cntv/live1/n-aiqingxj/n-aiqingxj"];
        NSArray *jvchangArr = @[model8, dongzuodianyingModel, jiatingjvchangModel, jingsongdianyingModel, jingpindajvModel, guzhuangModel, junlvjvchangModel, rebojingxuanModel, heimei2Model, aiqingxijvModel];
        KKModel *jvchangModel = [[KKModel alloc] initWithTitle:@"剧场" tvs:jvchangArr];
        
        
        
        [_dataArray addObject:yangshiModel];
        [_dataArray addObject:weishiModel];
        [_dataArray addObject:junshinongyeModel];
        [_dataArray addObject:jvchangModel];
        [_dataArray addObject:zongyisecModel];
        [_dataArray addObject:shaoerModel];
        [_dataArray addObject:otherModel];

        
    }
    return _dataArray;
}


@end
