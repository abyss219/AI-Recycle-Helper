//
//  AIViewController.swift
//  AI_Recycle_Helper
//
//  Created by R L on 2022-04-03.
//
import UIKit


class AIViewController: UIViewController{

    
    @IBOutlet weak var resultText: UILabel!
    
    @IBOutlet weak var detectImage: UIImageView!
    var index = 0

    var results = ["","",""]
    var theImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultText.text=results[index]
        print("the image 3",theImage)
        detectImage.image = theImage
        defineCatagories()
    }
  
   
    @IBAction func lastButtonIsPressed(_ sender: UIButton) {
        if (index>0){
            index -= 1
            resultText.text=results[index]
        }
        defineCatagories()
        
    }
    
    @IBAction func nextButtonIsPressed(_ sender: UIButton) {
        if (index<2){
            index += 1
            resultText.text=results[index]
        }
        defineCatagories()
    }
 

    var paperBin = ["Paper","Cardboard"]
    var glassBin = ["Glass","Ceramics"]
    var furniture = ["Table"]
    var food = ["Organic"]
    var containerBin = ["Metal"]
    
    func defineCatagories(){
        if self.glassBin.contains(results[index]){
            resultText.text = "Glass: "+results[index]
            resultText.textColor = UIColor(red:176.0/255.0, green:176.0/255.0, blue:176.0/255.0, alpha: 1.0)
        }
        else if(self.containerBin.contains(results[index])){
            resultText.text = "Container: "+results[index]
            resultText.textColor = UIColor.blue
        }

        else if(self.paperBin.contains(results[index])){
            resultText.text = "Paper: "+results[index]
            resultText.textColor = UIColor.orange
        }

        else if(self.food.contains(results[index])){
            resultText.text = "Organic: "+results[index]
            resultText.textColor = UIColor.green
        }

        else if(self.furniture.contains(results[index])){
            resultText.text = "Furniture: "+results[index]
            resultText.textColor = UIColor.purple
        }
        else{
            resultText.text = "Trash: "+results[index]
            resultText.textColor = UIColor.black
        }


    }
    
    
//    var animal=["tench, Tinca tinca", "goldfish, Carassius auratus", "great white shark, white shark, man-eater, man-eating shark, Carcharodon carcharias", "tiger shark, Galeocerdo cuvieri", "hammerhead, hammerhead shark", "electric ray, crampfish, numbfish, torpedo", "stingray", "cock", "hen", "ostrich, Struthio camelus", "brambling, Fringilla montifringilla", "goldfinch, Carduelis carduelis", "house finch, linnet, Carpodacus mexicanus", "junco, snowbird", "indigo bunting, indigo finch, indigo bird, Passerina cyanea", "robin, American robin, Turdus migratorius", "bulbul", "jay", "magpie", "chickadee", "water ouzel, dipper", "kite", "bald eagle, American eagle, Haliaeetus leucocephalus", "vulture", "great grey owl, great gray owl, Strix nebulosa", "European fire salamander, Salamandra salamandra", "common newt, Triturus vulgaris", "eft", "spotted salamander, Ambystoma maculatum", "axolotl, mud puppy, Ambystoma mexicanum", "bullfrog, Rana catesbeiana", "tree frog, tree-frog", "tailed frog, bell toad, ribbed toad, tailed toad, Ascaphus trui", "loggerhead, loggerhead turtle, Caretta caretta", "leatherback turtle, leatherback, leathery turtle, Dermochelys coriacea", "mud turtle", "terrapin", "box turtle, box tortoise", "banded gecko", "common iguana, iguana, Iguana iguana", "American chameleon, anole, Anolis carolinensis", "whiptail, whiptail lizard", "agama", "frilled lizard, Chlamydosaurus kingi", "alligator lizard", "Gila monster, Heloderma suspectum", "green lizard, Lacerta viridis", "African chameleon, Chamaeleo chamaeleon", "Komodo dragon, Komodo lizard, dragon lizard, giant lizard, Varanus komodoensis", "African crocodile, Nile crocodile, Crocodylus niloticus", "American alligator, Alligator mississipiensis", "triceratops", "thunder snake, worm snake, Carphophis amoenus", "ringneck snake, ring-necked snake, ring snake", "hognose snake, puff adder, sand viper", "green snake, grass snake", "king snake, kingsnake", "garter snake, grass snake", "water snake", "vine snake", "night snake, Hypsiglena torquata", "boa constrictor, Constrictor constrictor", "rock python, rock snake, Python sebae", "Indian cobra, Naja naja", "green mamba", "sea snake", "horned viper, cerastes, sand viper, horned asp, Cerastes cornutus", "diamondback, diamondback rattlesnake, Crotalus adamanteus", "sidewinder, horned rattlesnake, Crotalus cerastes", "trilobite", "harvestman, daddy longlegs, Phalangium opilio", "scorpion", "black and gold garden spider, Argiope aurantia", "barn spider, Araneus cavaticus", "garden spider, Aranea diademata", "black widow, Latrodectus mactans", "tarantula", "wolf spider, hunting spider", "tick", "centipede", "black grouse", "ptarmigan", "ruffed grouse, partridge, Bonasa umbellus", "prairie chicken, prairie grouse, prairie fowl", "peacock", "quail", "partridge", "African grey, African gray, Psittacus erithacus", "macaw", "sulphur-crested cockatoo, Kakatoe galerita, Cacatua galerita", "lorikeet", "coucal", "bee eater", "hornbill", "hummingbird", "jacamar", "toucan", "drake", "red-breasted merganser, Mergus serrator", "goose", "black swan, Cygnus atratus", "tusker", "echidna, spiny anteater, anteater", "platypus, duckbill, duckbilled platypus, duck-billed platypus, Ornithorhynchus anatinus", "wallaby, brush kangaroo", "koala, koala bear, kangaroo bear, native bear, Phascolarctos cinereus", "wombat", "jellyfish", "sea anemone, anemone", "brain coral", "flatworm, platyhelminth", "nematode, nematode worm, roundworm", "conch", "snail", "slug", "sea slug, nudibranch", "chiton, coat-of-mail shell, sea cradle, polyplacophore", "chambered nautilus, pearly nautilus, nautilus", "Dungeness crab, Cancer magister", "rock crab, Cancer irroratus", "fiddler crab", "king crab, Alaska crab, Alaskan king crab, Alaska king crab, Paralithodes camtschatica", "American lobster, Northern lobster, Maine lobster, Homarus americanus", "spiny lobster, langouste, rock lobster, crawfish, crayfish, sea crawfish", "crayfish, crawfish, crawdad, crawdaddy", "hermit crab", "isopod", "white stork, Ciconia ciconia", "black stork, Ciconia nigra", "spoonbill", "flamingo", "little blue heron, Egretta caerulea", "American egret, great white heron, Egretta albus", "bittern", "crane", "limpkin, Aramus pictus", "European gallinule, Porphyrio porphyrio", "American coot, marsh hen, mud hen, water hen, Fulica americana", "bustard", "ruddy turnstone, Arenaria interpres", "red-backed sandpiper, dunlin, Erolia alpina", "redshank, Tringa totanus", "dowitcher", "oystercatcher, oyster catcher", "pelican", "king penguin, Aptenodytes patagonica", "albatross, mollymawk", "grey whale, gray whale, devilfish, Eschrichtius gibbosus, Eschrichtius robustus", "killer whale, killer, orca, grampus, sea wolf, Orcinus orca", "dugong, Dugong dugon", "sea lion", "Chihuahua", "Japanese spaniel", "Maltese dog, Maltese terrier, Maltese", "Pekinese, Pekingese, Peke", "Shih-Tzu", "Blenheim spaniel", "papillon", "toy terrier", "Rhodesian ridgeback", "Afghan hound, Afghan", "basset, basset hound", "beagle", "bloodhound, sleuthhound", "bluetick", "black-and-tan coonhound", "Walker hound, Walker foxhound", "English foxhound", "redbone", "borzoi, Russian wolfhound", "Irish wolfhound", "Italian greyhound", "whippet", "Ibizan hound, Ibizan Podenco", "Norwegian elkhound, elkhound", "otterhound, otter hound", "Saluki, gazelle hound", "Scottish deerhound, deerhound", "Weimaraner", "Staffordshire bullterrier, Staffordshire bull terrier", "American Staffordshire terrier, Staffordshire terrier, American pit bull terrier, pit bull terrier", "Bedlington terrier", "Border terrier", "Kerry blue terrier", "Irish terrier", "Norfolk terrier", "Norwich terrier", "Yorkshire terrier", "wire-haired fox terrier", "Lakeland terrier", "Sealyham terrier, Sealyham", "Airedale, Airedale terrier", "cairn, cairn terrier", "Australian terrier", "Dandie Dinmont, Dandie Dinmont terrier", "Boston bull, Boston terrier", "miniature schnauzer", "giant schnauzer", "standard schnauzer", "Scotch terrier, Scottish terrier, Scottie", "Tibetan terrier, chrysanthemum dog", "silky terrier, Sydney silky", "soft-coated wheaten terrier", "West Highland white terrier", "Lhasa, Lhasa apso", "flat-coated retriever", "curly-coated retriever", "golden retriever", "Labrador retriever", "Chesapeake Bay retriever", "German short-haired pointer", "vizsla, Hungarian pointer", "English setter", "Irish setter, red setter", "Gordon setter", "Brittany spaniel", "clumber, clumber spaniel", "English springer, English springer spaniel", "Welsh springer spaniel", "cocker spaniel, English cocker spaniel, cocker", "Sussex spaniel", "Irish water spaniel", "kuvasz", "schipperke", "groenendael", "malinois", "briard", "kelpie", "komondor", "Old English sheepdog, bobtail", "Shetland sheepdog, Shetland sheep dog, Shetland", "collie", "Border collie", "Bouvier des Flandres, Bouviers des Flandres", "Rottweiler", "German shepherd, German shepherd dog, German police dog, alsatian", "Doberman, Doberman pinscher", "miniature pinscher", "Greater Swiss Mountain dog", "Bernese mountain dog", "Appenzeller", "EntleBucher", "boxer", "bull mastiff", "Tibetan mastiff", "French bulldog", "Great Dane", "Saint Bernard, St Bernard", "Eskimo dog, husky", "malamute, malemute, Alaskan malamute", "Siberian husky", "dalmatian, coach dog, carriage dog", "affenpinscher, monkey pinscher, monkey dog", "basenji", "pug, pug-dog", "Leonberg", "Newfoundland, Newfoundland dog", "Great Pyrenees", "Samoyed, Samoyede", "Pomeranian", "chow, chow chow", "keeshond", "Brabancon griffon", "Pembroke, Pembroke Welsh corgi", "Cardigan, Cardigan Welsh corgi", "toy poodle", "miniature poodle", "standard poodle", "Mexican hairless", "timber wolf, grey wolf, gray wolf, Canis lupus", "white wolf, Arctic wolf, Canis lupus tundrarum", "red wolf, maned wolf, Canis rufus, Canis niger", "coyote, prairie wolf, brush wolf, Canis latrans", "dingo, warrigal, warragal, Canis dingo", "dhole, Cuon alpinus", "African hunting dog, hyena dog, Cape hunting dog, Lycaon pictus", "hyena, hyaena", "red fox, Vulpes vulpes", "kit fox, Vulpes macrotis", "Arctic fox, white fox, Alopex lagopus", "grey fox, gray fox, Urocyon cinereoargenteus", "tabby, tabby cat", "tiger cat", "Persian cat", "Siamese cat, Siamese", "Egyptian cat", "cougar, puma, catamount, mountain lion, painter, panther, Felis concolor", "lynx, catamount", "leopard, Panthera pardus", "snow leopard, ounce, Panthera uncia", "jaguar, panther, Panthera onca, Felis onca", "lion, king of beasts, Panthera leo", "tiger, Panthera tigris", "cheetah, chetah, Acinonyx jubatus", "brown bear, bruin, Ursus arctos", "American black bear, black bear, Ursus americanus, Euarctos americanus", "ice bear, polar bear, Ursus Maritimus, Thalarctos maritimus", "sloth bear, Melursus ursinus, Ursus ursinus", "mongoose", "meerkat, mierkat", "tiger beetle", "ladybug, ladybeetle, lady beetle, ladybird, ladybird beetle", "ground beetle, carabid beetle", "long-horned beetle, longicorn, longicorn beetle", "leaf beetle, chrysomelid", "dung beetle", "rhinoceros beetle", "weevil", "fly", "bee", "ant, emmet, pismire", "grasshopper, hopper", "cricket", "walking stick, walkingstick, stick insect", "cockroach, roach", "mantis, mantid", "cicada, cicala", "leafhopper", "lacewing, lacewing fly", "dragonfly, darning needle, devil's darning needle, sewing needle, snake feeder, snake doctor, mosquito hawk, skeeter hawk", "damselfly", "admiral", "ringlet, ringlet butterfly", "monarch, monarch butterfly, milkweed butterfly, Danaus plexippus", "cabbage butterfly", "sulphur butterfly, sulfur butterfly", "lycaenid, lycaenid butterfly", "starfish, sea star", "sea urchin", "sea cucumber, holothurian", "wood rabbit, cottontail, cottontail rabbit", "hare", "Angora, Angora rabbit", "hamster", "porcupine, hedgehog", "fox squirrel, eastern fox squirrel, Sciurus niger", "marmot", "beaver", "guinea pig, Cavia cobaya", "sorrel", "zebra", "hog, pig, grunter, squealer, Sus scrofa", "wild boar, boar, Sus scrofa", "warthog", "hippopotamus, hippo, river horse, Hippopotamus amphibius", "ox", "water buffalo, water ox, Asiatic buffalo, Bubalus bubalis", "bison", "ram, tup", "bighorn, bighorn sheep, cimarron, Rocky Mountain bighorn, Rocky Mountain sheep, Ovis canadensis", "ibex, Capra ibex", "hartebeest", "impala, Aepyceros melampus", "gazelle", "Arabian camel, dromedary, Camelus dromedarius", "llama", "weasel", "mink", "polecat, fitch, foulmart, foumart, Mustela putorius", "black-footed ferret, ferret, Mustela nigripes", "otter", "skunk, polecat, wood pussy", "badger", "armadillo", "three-toed sloth, ai, Bradypus tridactylus", "orangutan, orang, orangutang, Pongo pygmaeus", "gorilla, Gorilla gorilla", "chimpanzee, chimp, Pan troglodytes", "gibbon, Hylobates lar", "siamang, Hylobates syndactylus, Symphalangus syndactylus", "guenon, guenon monkey", "patas, hussar monkey, Erythrocebus patas", "baboon", "macaque", "langur", "colobus, colobus monkey", "proboscis monkey, Nasalis larvatus", "marmoset", "capuchin, ringtail, Cebus capucinus", "howler monkey, howler", "titi, titi monkey", "spider monkey, Ateles geoffroyi", "squirrel monkey, Saimiri sciureus", "Madagascar cat, ring-tailed lemur, Lemur catta", "indri, indris, Indri indri, Indri brevicaudatus", "Indian elephant, Elephas maximus", "African elephant, Loxodonta africana", "lesser panda, red panda, panda, bear cat, cat bear, Ailurus fulgens", "giant panda, panda, panda bear, coon bear, Ailuropoda melanoleuca", "barracouta, snoek", "eel", "coho, cohoe, coho salmon, blue jack, silver salmon, Oncorhynchus kisutch", "rock beauty, Holocanthus tricolor", "anemone fish", "sturgeon", "gar, garfish, garpike, billfish, Lepisosteus osseus", "lionfish", "puffer, pufferfish, blowfish, globefish"]
//    var glassBin=["beer bottle","beer glass","coffee mug","red wine","wine bottle","perfume, essence","plate","cup","beaker"]
//    var containerBin=["pop bottle, soda bottle","pill bottle"]
//    var paperBin=["comic book"]
//    var depot=["toilet tissue, toilet paper, bathroom tissue","bath towel","cellular telephone, cellular phone, cellphone, cell, mobile phone","paper towel","nail","worm fence, snake fence, snake-rail fence, Virginia fence","notebook, notebook computer","balloon","space bar","menu","book jacket, dust cover, dust jacket, dust wrapper","teapot"]
//    var food=["pizza, pizza pie","meat loaf, meatloaf","hotdog, hot dog, red hot","mashed potato","broccoli","bell pepper","mushroom","banana","pineapple, ananas","strawberry","orange","lemon","jackfruit, jak, jack","custard apple","pomegranate","fig","guacamole", "consomme", "hot pot, hotpot", "trifle", "ice cream, icecream", "ice lolly, lolly, lollipop, popsicle", "French loaf", "bagel, beigel", "pretzel", "cheeseburger", "head cabbage", "cauliflower", "zucchini, courgette", "spaghetti squash", "acorn squash", "butternut squash", "cucumber, cuke", "artichoke, globe artichoke", "cardoon", "Granny Smith", "hay", "carbonara", "chocolate sauce, chocolate syrup", "dough", "potpie", "burrito", "espresso", "eggnog", "alp", "bubble", "cliff, drop, drop-off", "coral reef", "geyser", "lakeside, lakeshore", "promontory, headland, head, foreland", "sandbar, sand bar", "seashore, coast, seacoast, sea-coast", "valley, vale", "volcano", "ballplayer, baseball player", "groom, bridegroom", "scuba diver", "rapeseed", "daisy", "yellow lady's slipper, yellow lady-slipper, Cypripedium calceolus, Cypripedium parviflorum", "corn", "acorn", "hip, rose hip, rosehip", "buckeye, horse chestnut, conker", "coral fungus", "agaric", "gyromitra", "stinkhorn, carrion fungus", "earthstar", "hen-of-the-woods, hen of the woods, Polyporus frondosus, Grifola frondosa", "bolete", "ear, spike, capitulum"]
//    var furniture=["desk"]
//
//
//    func defineCatagories(){
//        if self.glassBin.contains(results[index]){
//            resultText.text = "Glass: "+results[index]
//            resultText.textColor = UIColor(red:176.0/255.0, green:176.0/255.0, blue:176.0/255.0, alpha: 1.0)
//        }
//        else if(self.containerBin.contains(results[index])){
//            resultText.text = "Container: "+results[index]
//            resultText.textColor = UIColor.blue
//        }
//
//        else if(self.paperBin.contains(results[index])){
//            resultText.text = "Paper: "+results[index]
//            resultText.textColor = UIColor.orange
//        }
//
//        else if(self.food.contains(results[index])){
//            resultText.text = "Organic: "+results[index]
//            resultText.textColor = UIColor.green
//        }
//
//        else if(self.furniture.contains(results[index])){
//            resultText.text = "Furniture: "+results[index]
//            resultText.textColor = UIColor.purple
//        }
//        else if(self.animal.contains(results[index])){
//            resultText.text = "Living Thing: "+results[index]
//            resultText.textColor = UIColor.red
//        }
//        else{
//            resultText.text = "Trash: "+results[index]
//            resultText.textColor = UIColor.black
//        }
//
//
//    }
}
