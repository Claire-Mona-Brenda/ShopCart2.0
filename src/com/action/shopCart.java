package com.action;
import java.util.ArrayList;
import com.po.GoodInfo;
public class shopCart {
	private ArrayList<GoodInfo>cartList=new ArrayList<GoodInfo>();
	public ArrayList<GoodInfo> getCartList(){
		return cartList;
	}
	public void addItem(GoodInfo single){
		if(single!=null){
			if(cartList.size()==0){
				GoodInfo item=new GoodInfo();
				item.setName(single.getName());
				item.setPrice(single.getPrice());
				item.setNum(single.getNum());
				item.setId(single.getId());
				cartList.add(item);
			}
			else{
				int i=0;
				for(;i<cartList.size();i++){
					GoodInfo item=cartList.get(i);
					if(item.getName().equals(single.getName())){
						item.setNum(item.getNum()+1);
						break;
					}
				}
				if(i>=cartList.size()){
					GoodInfo item=new GoodInfo();
					item.setName(single.getName());
					item.setPrice(single.getPrice());
					item.setNum(single.getNum());
					item.setId(single.getId());
					cartList.add(item);
				}
			}
		}
	}
	public void removeItem(String name){
		for(int i=0;i<cartList.size();i++){
			GoodInfo item=cartList.get(i);
			if(item.getName().equals(name)){
				if(item.getNum()>1){
					item.setNum(item.getNum()-1);
					break;
				}
				else if(item.getNum()==1){
					cartList.remove(i);
				}
			}
		}
	}
	public void clearCart(){
		cartList.clear();
	}

}
